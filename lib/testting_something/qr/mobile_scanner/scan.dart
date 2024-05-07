import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hyper_ui/testting_something/qr/mobile_scanner/result_scan_page.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScanPage extends StatefulWidget {
  ScanPage({super.key});

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  BarcodeCapture? barcode;

  late final MobileScannerController controller;

  bool isStarted = true;
  @override
  void initState() {
    super.initState();
    controller = MobileScannerController(
      torchEnabled: false,
      // formats: [BarcodeFormat.qrCode]
      // facing: CameraFacing.front,
      // detectionSpeed: DetectionSpeed.normal
      // detectionTimeoutMs: 1000,
      // returnImage: false,
    );
    controller.start();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   appBar: AppBar(
    //     title: const Text("Dashboard"),
    //     actions: const [],
    //   ),
    //   body:
    //       //  MobileScanner(
    //       //   onDetect: (capture) {
    //       //     final List<Barcode> listBarcode = capture.barcodes;
    //       //     final Uint8List? img = capture.image;
    //       //     for (final barcode in listBarcode) {
    //       //       log('Barcode found! ${barcode.rawValue}');
    //       //     }
    //       //   },
    //       // ),
    //       MobileScanner(
    //     // fit: BoxFit.contain,
    //     controller: MobileScannerController(
    //       detectionSpeed: DetectionSpeed.normal,
    //       facing: CameraFacing.front,
    //       torchEnabled: true,
    //     ),
    //     onDetect: (capture) {
    //       final List<Barcode> barcodes = capture.barcodes;
    //       final Uint8List? image = capture.image;
    //       for (final barcode in barcodes) {
    //         log('Barcode found! ${barcode.rawValue}');
    //       }
    //     },
    //   ),
    // );
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.camera),
        onPressed: () async {
          await controller.stop().then((_) => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ResultScanPage(
                          result: barcode!.barcodes.last.rawValue!,
                        )),
              ));
          controller.start();
        },
      ),
      appBar: AppBar(
        title: const Text('Mobile Scanner'),
        actions: [
          IconButton(
            color: Colors.white,
            icon: ValueListenableBuilder(
              valueListenable: controller.torchState,
              builder: (context, state, child) {
                switch (state as TorchState) {
                  case TorchState.off:
                    return const Icon(Icons.flash_off, color: Colors.grey);
                  case TorchState.on:
                    return const Icon(Icons.flash_on, color: Colors.yellow);
                }
              },
            ),
            iconSize: 32.0,
            onPressed: () => controller.toggleTorch(),
          ),
          IconButton(
            color: Colors.white,
            icon: ValueListenableBuilder(
              valueListenable: controller.cameraFacingState,
              builder: (context, state, child) {
                switch (state as CameraFacing) {
                  case CameraFacing.front:
                    return const Icon(Icons.camera_front);
                  case CameraFacing.back:
                    return const Icon(Icons.camera_rear);
                }
              },
            ),
            iconSize: 32.0,
            onPressed: () => controller.switchCamera(),
          ),
        ],
      ),
      body: MobileScanner(
        controller: controller,
        errorBuilder: (
          BuildContext context,
          MobileScannerException error,
          Widget? child,
        ) {
          return ScannerErrorWidget(error: error);
        },
        fit: BoxFit.contain,
        onDetect: (BarcodeCapture barcode) async {
          setState(() {
            this.barcode = barcode;
          });
          await controller.stop().then((_) => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ResultScanPage(
                          result: barcode!.barcodes.last.rawValue!,
                        )),
              ));
          controller.start();
        },
      ),

      // return Scaffold(
      //   appBar: AppBar(title: const Text('Mobile Scanner')),
      //   body: MobileScanner(
      //     fit: BoxFit.contain,
      //     controller: MobileScannerController(
      //       // facing: CameraFacing.back,
      //       // torchEnabled: false,
      //       returnImage: true,
      //     ),
      //     onDetect: (capture) {
      //       final List<Barcode> barcodes = capture.barcodes;
      //       final Uint8List? image = capture.image;
      //       for (final barcode in barcodes) {
      //         log('Barcode found! ${barcode.rawValue}');
      //       }
      //       if (image != null) {
      //         showDialog(
      //           context: context,
      //           builder: (context) => Image(image: MemoryImage(image)),
      //         );
      //         Future.delayed(const Duration(seconds: 5), () {
      //           Navigator.pop(context);
      //           log('Barcode Delay!');
      //         });
      //       }
      //     },
      //   ),
    );
  }
}

class ScannerErrorWidget extends StatelessWidget {
  const ScannerErrorWidget({super.key, required this.error});

  final MobileScannerException error;

  @override
  Widget build(BuildContext context) {
    String errorMessage;

    switch (error.errorCode) {
      case MobileScannerErrorCode.controllerUninitialized:
        errorMessage = 'Controller not ready.';
        break;
      case MobileScannerErrorCode.permissionDenied:
        errorMessage = 'Permission denied';
        break;
      default:
        errorMessage = 'Generic Error';
        break;
    }

    return ColoredBox(
      color: Colors.black,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: Icon(Icons.error, color: Colors.white),
            ),
            Text(
              errorMessage,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
