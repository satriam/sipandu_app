import 'package:SiPandu/core.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RefreshTokenService {
  final Dio dio = Dio();
  final CookieJar cookieJar = CookieJar();

  RefreshTokenService() {
    dio.interceptors.add(CookieManager(cookieJar));
  }

  Future<Map<String, String?>> getRefreshToken() async {
    final prefs = await SharedPreferences.getInstance();
    final refreshToken = prefs.getString('refreshToken');
    final refreshTokenSig = prefs.getString('refreshToken.sig');
    return {
      'refreshToken': refreshToken,
      'refreshToken.sig': refreshTokenSig,
    };
  }

  Future<void> saveCookies(String baseUrl) async {
    final cookies = await cookieJar.loadForRequest(Uri.parse(baseUrl));
    final prefs = await SharedPreferences.getInstance();
    for (var cookie in cookies) {
      if (cookie.name == 'refreshToken') {
        await prefs.setString('refreshToken', cookie.value);
      } else if (cookie.name == 'refreshToken.sig') {
        await prefs.setString('refreshToken.sig', cookie.value);
      }
    }
  }

  Future<void> refreshToken() async {
    final tokens = await getRefreshToken();
    final refreshToken = tokens['refreshToken'];
    final refreshTokenSig = tokens['refreshToken.sig'];
    // print(tokens);
    if (refreshToken == null || refreshTokenSig == null) {
      print('No refresh token found');
      return;
    }

    try {
      String? token = await NetworkController().jwtOrEmpty;
      var response = await dio.post(
        "${ApiUrl.baseUrl}/api/token/refresh",
        options: Options(
          headers: {
            // "Content-Type": "application/json",
            "Authorization": "Bearer $token",
          },
        ),
        data: {
          'refreshToken': refreshToken,
          'refreshToken.sig': refreshTokenSig,
        },
      );

      if (response.statusCode == 200) {
        await saveCookies('${ApiUrl.baseUrl}');
        final newJwt = response.data['jwt'];
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('token', newJwt);
        print(newJwt);
      } else {
        print('Failed to refresh token');
      }
    } catch (e) {
      print('Failed to refresh token: ${e}');
    }
  }
}
