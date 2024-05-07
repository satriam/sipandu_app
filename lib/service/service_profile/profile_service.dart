import 'package:dio/dio.dart';
import 'package:hyper_ui/core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileService {
  get() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    var response = await Dio().get(
      "${ApiUrl.baseUrl}/api/users/me?populate=*",
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${token}"
        },
      ),
    );
    Map obj = response.data;
    // print(obj);
    return obj;
  }
}
