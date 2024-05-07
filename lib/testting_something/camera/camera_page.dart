import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class PackageCameraPage extends StatefulWidget {
  const PackageCameraPage({super.key});

  @override
  State<PackageCameraPage> createState() => _PackageCameraPageState();
}

class _PackageCameraPageState extends State<PackageCameraPage> {
  XFile? picture;
  void takePicture(XFile file) {
    picture = file;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Package Camera Page"),
        actions: const [],
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              picture == null
                  ? CircularProgressIndicator()
                  : SizedBox(
                      height: 200,
                      width: double.infinity,
                      child: Image.file(
                        File(
                          picture!.path,
                        ),
                      ),
                    ),
              const SizedBox(
                height: 30.0,
              ),
              ElevatedButton(
                onPressed: () async {
                  await availableCameras().then(
                    (value) => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) {
                          return CameraPage(
                            takePicture: takePicture,
                            cameras: value,
                          );
                        },
                      ),
                    ),
                  );
                },
                child: const Text("Camera"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CameraPage extends StatefulWidget {
  static const routeName = '/camera-page';
  final Function(XFile) takePicture;
  final List<CameraDescription>? cameras;
  const CameraPage({
    Key? key,
    required this.takePicture,
    this.cameras,
  }) : super(key: key);

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late CameraController controller;
  XFile? capturedImage;

  Future takePicture() async {
    if (!controller.value.isInitialized) {
      return null;
    }
    if (controller.value.isTakingPicture) {
      return null;
    }
    try {
      controller.setFlashMode(FlashMode.torch);
      XFile image = await controller.takePicture();
      controller.setFlashMode(FlashMode.off);
      widget.takePicture(image);

      // ignore: use_build_context_synchronously
      Navigator.pop(context);
    } on CameraException catch (e) {
      debugPrint('Error occured while taking picture: $e');
      return null;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  void initState() {
    super.initState();
    controller = CameraController(widget.cameras![0], ResolutionPreset.max);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            // Handle access errors here.
            break;
          default:
            // Handle other errors here.
            break;
        }
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return Container();
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                CameraPreview(controller),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      takePicture();
                    },
                    child: const Text(
                      'Ambil Foto',
                    ),
                  ),
                )
              ],
            ),
            Expanded(
                child: Container(
              color: Colors.grey,
              child: const Center(
                child: Text('Untuk Iklan'),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
