import 'package:SiPandu/core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileService {
  Future<Map<String, String>> _getHeaders() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    return {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    };
  }

  Future<dynamic> get() async {
    try {
      var headers = await _getHeaders();
      var response = await Dio().get(
        "${ApiUrl.baseUrl}/api/users/me",
        options: Options(headers: headers),
      );

      if (response.statusCode == 200) {
        // print(response.data);
        return response.data;
      } else {
        print("Error: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }

  Future<dynamic> getall() async {
    try {
      var headers = await _getHeaders();
      var response = await Dio().get(
        "${ApiUrl.baseUrl}/api/users",
        options: Options(headers: headers),
      );

      if (response.statusCode == 200) {
        print(response.data);
        return response.data;
      } else {
        print("Error: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }
}
