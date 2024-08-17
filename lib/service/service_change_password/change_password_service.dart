import 'package:SiPandu/core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangePassword {
  Future<Map<String, String>> _getHeaders() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    return {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    };
  }

  post({
    required String newPassword,
    required String currentPassword,
    required String passwordConfirmation,
  }) async {
    var headers = await _getHeaders();
    var response = await Dio().post(
      "${ApiUrl.baseUrl}/api/auth/change-password",
      options: Options(headers: headers),
      data: {
        "currentPassword": currentPassword,
        "password": newPassword,
        "passwordConfirmation": passwordConfirmation,
      },
    );
    Map obj = response.data;
    return obj;
  }
}
