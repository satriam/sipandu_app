import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/core_package.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DumpingService {
  Future<List> get() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    print(token);
    var response = await Dio().get(
      "${ApiUrl.baseUrl}/api/dumpings?populate=*",
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Authorization": "bearer ${token}"
        },
      ),
    );
    Map obj = response.data;
    print(obj["data"]);
    return obj["data"];
  }
}
