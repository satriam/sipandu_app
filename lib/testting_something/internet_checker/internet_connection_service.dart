import 'dart:async';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class InternetConnectionService {
  late InternetConnectionChecker _internetConnectionChecker;
  late StreamController<bool> _connectionStatusController;

  InternetConnectionService() {
    _internetConnectionChecker = InternetConnectionChecker.createInstance(
      checkTimeout: const Duration(seconds: 1),
      checkInterval: const Duration(seconds: 1),
    );
    _connectionStatusController = StreamController<bool>.broadcast();

    // Initial check
    _checkInternetConnection();

    // Listen for status updates
    _internetConnectionChecker.onStatusChange.listen(
      (InternetConnectionStatus status) {
        bool isConnected = status == InternetConnectionStatus.connected;
        _connectionStatusController.add(isConnected);
      },
    );
  }

  Future<void> _checkInternetConnection() async {
    bool isConnected = await _internetConnectionChecker.hasConnection;
    _connectionStatusController.add(isConnected);
  }

  Stream<bool> get connectionStatus => _connectionStatusController.stream;

  void dispose() {
    _connectionStatusController.close();
  }
}
