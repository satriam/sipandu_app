import 'package:dio/dio.dart';
import 'package:hyper_ui/core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HaulingService {
  get() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    var response = await Dio().get(
      "${ApiUrl.baseUrl}/api/haulings",
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Authorization": "bearer ${token}"
        },
      ),
    );
    Map obj = response.data;
    return obj["data"];
  }
}
