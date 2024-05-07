import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerPage extends StatefulWidget {
  const ImagePickerPage({super.key});

  @override
  State<ImagePickerPage> createState() => _ImagePickerPageState();
}

class _ImagePickerPageState extends State<ImagePickerPage> {
  XFile? picture;
  Future<void> getImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? photo = await picker.pickImage(
      source: source,
      imageQuality: 50,
    );
    if (photo != null) {
      setState(() {
        picture = photo;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
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
              // Scrollbar(

              //   child: child)
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                ),
                onPressed: () async => getImage(ImageSource.camera),

                // onPressed: () {
                //   getImage(ImageSource.camera);
                // },
                child: const Text("Camera"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
