import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart' as getx; // Menggunakan alias getx
import 'package:SiPandu/core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class NetworkController extends getx.GetxController {
  final Connectivity _connectivity = Connectivity();
  bool isSnackbarDisplayed = false;
  ConnectivityResult previousConnectivity = ConnectivityResult.none;
  final String serverUrl = ApiUrl.baseUrl.toString();

  var isServerError = false.obs; // Observable untuk melacak status server

  @override
  void onInit() {
    super.onInit();
    _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  void _updateConnectionStatus(ConnectivityResult connectivityResult) {
    if (connectivityResult != previousConnectivity) {
      if (connectivityResult == ConnectivityResult.none) {
        snackbarDanger(message: "Cek internet", duration: 5);
      } else {
        snackbarSuccess(message: "Ada Internet");
        _checkServerStatus();
        checkTokenStatus();
      }
      previousConnectivity = connectivityResult;
    }
  }

  Future<void> _checkServerStatus() async {
    final dio = Dio();
    try {
      final response = await dio.get(serverUrl, options: Options(
        validateStatus: (status) {
          return status != null && status < 500;
        },
      ));
      if (response.statusCode == 200) {
        isServerError.value = false;
        snackbarSuccess(message: "Server is up");
      } else {
        isServerError.value = true;
        snackbarDanger(message: "Server error: ${response.statusCode}");
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 502) {
        isServerError.value = true;
        snackbarDanger(
            message:
                "Server error: 502. The server failed to fulfill the request.");
      } else {
        isServerError.value = true;
        snackbarDanger(message: "Server error: ${e.message}");
      }
    } catch (e) {
      isServerError.value = true;
      snackbarDanger(message: "Error: $e");
    }
  }

  Future<String> get jwtOrEmpty async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    print(token);
    if (token == null) return "";
    return token;
  }

  Future<bool> checkTokenStatus() async {
    try {
      String token =
          await jwtOrEmpty; // Fungsi untuk mendapatkan token, pastikan ini diimplementasikan
      bool isTokenExpired = JwtDecoder.isExpired(token);

      if (token.isEmpty || isTokenExpired) {
        snackbarDanger(message: "Sesi Telah Berakhir! Silahkan Login Kembali.");
        await redirectToLogin();
        return false;
      }
      return true;
    } catch (e) {
      // print('Error occurred: $e');
      snackbarDanger(message: "Token Tidak valid");
      return false;
    }
  }

  Future<void> redirectToLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    Get.offAll(LoginView());
  }
}
