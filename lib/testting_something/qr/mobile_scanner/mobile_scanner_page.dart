import 'package:flutter/material.dart';
import 'package:hyper_ui/testting_something/qr/mobile_scanner/scan.dart';

class MobileScannerPage extends StatelessWidget {
  const MobileScannerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        actions: const [],
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueGrey,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ScanPage()),
            );
          },
          child: const Text("Mobile Scanner"),
        ),
      ),
    );
  }
}
