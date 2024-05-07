import 'dart:typed_data';
import 'dart:ui' as ui;
// import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hyper_ui/testting_something/watermark_image/wateramak_packeg.dart';
import 'package:image_picker/image_picker.dart';

class WatermarkImagePage extends StatefulWidget {
  const WatermarkImagePage({Key? key}) : super(key: key);

  @override
  WatermarkImagePageState createState() => WatermarkImagePageState();
}

class WatermarkImagePageState extends State<WatermarkImagePage> {
  final _picker = ImagePicker();
  Uint8List? imgBytes;
  Uint8List? imgBytes2;
  XFile? _image;
  Uint8List? watermarkedImgBytes;
  bool isLoading = false;
  String watermarkTextValue = "", imgname = "image not selected";
  List<bool> textOrImage = [true, false];

  pickImage() async {
    final image = await _picker.pickImage(
      source: ImageSource.camera,
    );
    if (image != null) {
      _image = image;
      var t = await image.readAsBytes();
      imgBytes = Uint8List.fromList(t);
    }
    setState(() {});
  }

  pickImage2() async {
    XFile? image = await _picker.pickImage(
      source: ImageSource.camera,
    );
    if (image != null) {
      _image = image;
      imgname = image.name;
      var t = await image.readAsBytes();
      imgBytes2 = Uint8List.fromList(t);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('image_watermark'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: SizedBox(
            width: 600,
            child: Column(
              children: [
                GestureDetector(
                  onTap: pickImage,
                  child: Container(
                      margin: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5))),
                      width: 600,
                      height: 250,
                      child: _image == null
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.add_a_photo),
                                SizedBox(
                                  height: 10,
                                ),
                                Text('Click here to choose image')
                              ],
                            )
                          : Image.memory(imgBytes!,
                              width: 600, height: 200, fit: BoxFit.fitHeight)),
                ),
                ToggleButtons(
                  fillColor: Colors.amber,
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  borderWidth: 3,
                  borderColor: Colors.black26,
                  selectedBorderColor: Colors.black54,
                  selectedColor: Colors.black,
                  onPressed: (index) {
                    textOrImage = [false, false];
                    setState(() {
                      textOrImage[index] = true;
                    });
                  },
                  isSelected: textOrImage,
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        '  Text  ',
                      ),
                    ),
                    // second toggle button
                    Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          '  Image  ',
                        ))
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                textOrImage[0]
                    ? Padding(
                        padding: const EdgeInsets.all(15),
                        child: SizedBox(
                          width: 600,
                          child: TextField(
                            onChanged: (val) {
                              watermarkTextValue = val;
                            },
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Watermark Text',
                              hintText: 'Watermark Text',
                            ),
                          ),
                        ),
                      )
                    : Row(
                        children: [
                          ElevatedButton(
                              onPressed: pickImage2,
                              child: const Text('Select Watermark image')),
                          Text(imgname)
                        ],
                      ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      isLoading = true;
                    });
                    if (textOrImage[0]) {
                      watermarkedImgBytes =
                          await ImageWatermarkExtar.addTextWatermark(
                        ///image bytes
                        imgBytes: imgBytes!,

                        ///watermark text
                        watermarkText: watermarkTextValue,
                        color: Colors.black,
                        dstX: 400,
                        dstY: 70,
                      );

                      /// default : imageWidth/2
                    } else {
                      watermarkedImgBytes =
                          await ImageWatermarkExtar.addImageWatermark(
                              //image bytes
                              originalImageBytes: imgBytes!,
                              waterkmarkImageBytes: imgBytes2!,
                              imgHeight: 200,
                              imgWidth: 200,
                              dstY: 400,
                              dstX: 70);
                    }

                    setState(() {
                      isLoading = false;
                    });
                  },
                  child: const Text('Add Watermark'),
                ),
                const SizedBox(
                  height: 10,
                ),
                isLoading ? const CircularProgressIndicator() : Container(),
                watermarkedImgBytes == null
                    ? const SizedBox()
                    : Image.memory(watermarkedImgBytes!),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
