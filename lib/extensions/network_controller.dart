import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart' as getx;
import 'package:SiPandu/core.dart';

class NetworkController extends getx.GetxController {
  final Connectivity _connectivity = Connectivity();
  bool isSnackbarDisplayed = false;
  ConnectivityResult previousConnectivity = ConnectivityResult.none;

  @override
  void onInit() {
    super.onInit();
    _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  void _updateConnectionStatus(ConnectivityResult connectivityResult) {
    print(connectivityResult);
    if (connectivityResult != previousConnectivity) {
      // If the current connectivity is different from the previous one
      if (connectivityResult == ConnectivityResult.none) {
        // Show danger snackbar if no internet connection
        snackbarDanger(message: "Cek internet", duration: 5);
      } else {
        // Show success snackbar if internet is available
        snackbarSuccess(message: "Ada Internet");
      }
      // Update the previous connectivity
      previousConnectivity = connectivityResult;
    }
  }
}
