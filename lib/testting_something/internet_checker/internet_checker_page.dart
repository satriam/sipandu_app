import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hyper_ui/testting_something/internet_checker/internet_connection_service.dart';
import 'package:hyper_ui/testting_something/internet_checker/offline_page.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class InternetCheckerPage extends StatefulWidget {
  const InternetCheckerPage({super.key});

  @override
  State<InternetCheckerPage> createState() => _InternetCheckerPageState();
}

class _InternetCheckerPageState extends State<InternetCheckerPage> {
  late InternetConnectionService _connectionService;
  late StreamSubscription<bool> _connectionStatusSubscription;
  String? _connectionStatusMessage;
  bool isConnceted = true;
  @override
  void initState() {
    super.initState();
    _connectionService = InternetConnectionService();
    _connectionStatusSubscription =
        _connectionService.connectionStatus.listen((bool isConnected) {
      if (isConnected) {
        _updateConnectionStatus('Data connection is available.', isConnected);
      } else {
        _updateConnectionStatus(
            'You are disconnected from the internet.', isConnected);
      }
    });
  }

  void _updateConnectionStatus(String message, connected) {
    isConnceted = connected;
    setState(() {
      _connectionStatusMessage = message;
    });
  }

  @override
  void dispose() {
    _connectionStatusSubscription.cancel();
    _connectionService.dispose();
    super.dispose();
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Internet Checker Page"),
        actions: const [],
      ),
      body: Center(
        child: Column(
          children: [
            isConnceted
                ? SizedBox()
                : ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => OfflinePage()),
                      );
                    },
                    child: const Text("Change Offline"),
                  ),
            Text(
              _connectionStatusMessage ?? 'Checking internet connection...',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
