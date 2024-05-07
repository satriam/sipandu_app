import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hyper_ui/testting_something/internet_checker/internet_checker_page.dart';
import 'package:hyper_ui/testting_something/internet_checker/internet_connection_service.dart';
import 'package:hyper_ui/testting_something/internet_checker/offline_page.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class OfflinePage extends StatefulWidget {
  const OfflinePage({super.key});

  @override
  State<OfflinePage> createState() => _OfflinePageState();
}

class _OfflinePageState extends State<OfflinePage> {
  final InternetConnectionService _connectionService =
      InternetConnectionService();
  late StreamSubscription<bool> _connectionStatusSubscription;
  late String _connectionStatusMessage;
  bool isConnceted = true;
  @override
  void initState() {
    super.initState();
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
        title: const Text("Offline Page"),
        actions: const [],
      ),
      body: Center(
        child: Column(
          children: [
            isConnceted
                ? ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => InternetCheckerPage()),
                      );
                    },
                    child: const Text("Change Online"),
                  )
                : SizedBox(),
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
