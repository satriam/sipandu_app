import 'package:dio/dio.dart';
import 'package:hyper_ui/shared/util/url_api/url_api.dart';

class LoginResult {
  final bool success;
  final String?
      code; // Gunakan tanda tanya (?) untuk menunjukkan bahwa token dapat null

  LoginResult({
    required this.success,
    this.code,
  });
}

class LoginService {
  Future<LoginResult> login({
    required String email,
    required String password,
  }) async {
    try {
      var response = await Dio().post(
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
      print(obj);
      String? token = obj["jwt"];
      ApiUrl.token = token; // Simpan token ke dalam variabel ApiUrl
      return LoginResult(success: true);
    } on DioError catch (e) {
      if (e.response != null && e.response!.statusCode == 500) {
        // Kesalahan server dengan kode status 500
        // print("Server error: ${e.message}");
        return LoginResult(success: false, code: '500');
      }
    }
    // Tambahkan pengembalian default jika tidak ada kesalahan
    return LoginResult(success: false, code: '501');
  }
}
