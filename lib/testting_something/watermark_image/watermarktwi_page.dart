import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_image_edit_watermark/flutter_image_edit_watermark.dart';
import 'package:image_picker/image_picker.dart';

class WatermarkPage2 extends StatefulWidget {
  const WatermarkPage2({super.key});

  @override
  State<WatermarkPage2> createState() => _WatermarkPage2State();
}

class _WatermarkPage2State extends State<WatermarkPage2> {
  String _platformVersion = 'Unknown';
  final _flutterImageEditWatermarkPlugin = FlutterImageEditWatermark();

  String? imagePath;
  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion =
          await _flutterImageEditWatermarkPlugin.getPlatformVersion() ??
              'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('flutter_image_edit_watermark'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ElevatedButton(
                child: Text('camera'),
                onPressed: () {
                  _onCameraPickerPressed();
                },
              ),
              if (imagePath != null) Image.file(File(imagePath!))
            ],
          ),
        ),
      ),
    );
  }

  void _onCameraPickerPressed() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);

    String? path = image?.path;
    print("file: $path");

    if (path == null) return;

    String text = "07:55 pm 11/03/2022\nTaken by Xiao 50\nCupertino CA";

    var file = await _flutterImageEditWatermarkPlugin.editImage(
      path!,
      text,
    );

    print("file: $file");

    setState(() {
      imagePath = file;
    });
  }
}
