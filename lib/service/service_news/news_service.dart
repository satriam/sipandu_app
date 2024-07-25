import 'package:SiPandu/core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NewsService {
  Future<Map<String, String>> _getHeaders() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    return {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    };
  }

  get() async {
    var headers = await _getHeaders();
    try {
      NetworkController().checkTokenStatus();
      RefreshTokenService().refreshToken();
      var response = await Dio().get(
        "${ApiUrl.baseUrl}/api/information?sort=id:desc&populate=*",
        options: Options(headers: headers),
      );
      Map obj = response.data;
      // print(obj);
      return obj;
    } catch (e) {
      return null;
    }
  }

  post({String? information, int? id, List? news_type, String? photo}) async {
    var headers = await _getHeaders();
    var response = await Dio().post("${ApiUrl.baseUrl}/api/information",
        options: Options(headers: headers),
        data: {
          "data": {
            "information": information,
            "users_permissions_user": id,
            "news_types": news_type,
            "photo": photo
          }
        });
    Map obj = response.data;
    // print(obj);
    return obj;
  }
}
