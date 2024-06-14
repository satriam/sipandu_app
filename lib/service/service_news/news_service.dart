import 'package:SiPandu/core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NewsService {
  get() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    var response = await Dio().get(
      "${ApiUrl.baseUrl}/api/information?sort=id:desc&populate=*",
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

  post({String? information, int? id}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    var response = await Dio().post("${ApiUrl.baseUrl}/api/information",
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer ${token}"
          },
        ),
        data: {
          "data": {
            "information": information,
            "users_permissions_user": id,
          }
        });
    Map obj = response.data;
    // print(obj);
    return obj;
  }
}
