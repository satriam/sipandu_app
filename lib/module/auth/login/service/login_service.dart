import 'package:SiPandu/core.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginResult {
  final bool success;
  final String? code;
  final bool? confirmed;

  LoginResult({required this.success, this.code, this.confirmed});
}

class LoginService {
  final Dio dio;
  final CookieJar cookieJar;

  LoginService()
      : dio = Dio(),
        cookieJar = CookieJar() {
    dio.interceptors.add(CookieManager(cookieJar));
  }

  Future<LoginResult> login({
    required String email,
    required String password,
  }) async {
    try {
      String? fcmToken = await NotificationService().getToken();
      var response = await dio.post(
        "${ApiUrl.baseUrl}/api/auth/local",
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
        data: {
          "identifier": email,
          "password": password,
        },
      );
      Map obj = response.data;
      String? token = obj["jwt"];
      String? role_job = obj['user']['Role_job'];
      String? nama = obj['user']['Nama'];
      bool confirmed = obj['user']['confirmed'];
      int id = obj['user']['id'];
      String? supervisor = obj['user']['Supervisor'];
      String? grup = obj['user']['grup'];

      ApiUrl.token = token;
      ApiUrl.role_job = role_job;
      ApiUrl.id = id;
      ApiUrl.name = nama;
      ApiUrl.supervisor = supervisor;
      ApiUrl.grup = grup;

      await saveCookies("${ApiUrl.baseUrl}");

      await dio.put(
        "${ApiUrl.baseUrl}/api/users/$id",
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Authorization": "bearer $token"
          },
        ),
        data: {
          "Token": fcmToken,
        },
      );

      // print(response2);

      return LoginResult(success: true, confirmed: confirmed);
    } catch (e) {
      return LoginResult(success: false, code: '501');
    }
  }

  Future<void> saveCookies(String url) async {
    final prefs = await SharedPreferences.getInstance();
    final cookies = await cookieJar.loadForRequest(Uri.parse(url));
    // print("cookies: " + cookies.toString());
    for (var cookie in cookies) {
      if (cookie.name == 'refreshToken') {
        await prefs.setString('refreshToken', cookie.value);
      } else if (cookie.name == 'refreshToken.sig') {
        await prefs.setString('refreshToken.sig', cookie.value);
      }
    }
  }
}
