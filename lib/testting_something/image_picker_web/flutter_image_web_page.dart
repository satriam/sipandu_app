// import 'dart:io';
// import 'package:file_picker/file_picker.dart';
// import 'dart:typed_data';
// import 'dart:html' as html;
// import 'dart:convert';

// import 'package:flutter/material.dart';

// import 'package:image_picker_web/image_picker_web.dart';

// class FlutterImageWebPage extends StatefulWidget {
//   const FlutterImageWebPage({super.key});

//   @override
//   State<FlutterImageWebPage> createState() => _FlutterImageWebPageState();
// }

// class _FlutterImageWebPageState extends State<FlutterImageWebPage> {
//   Image? _photo;

//   File? _selectImage;
//   Future<File?> pickAndConvertImage() async {
//     FilePickerResult? result = await FilePicker.platform.pickFiles(
//       type: FileType.custom,
//       allowedExtensions: ['jpg', 'jpeg', 'png'], // jenis file yang diizinkan
//     );

//     if (result != null) {
//       Uint8List fileBytes = result.files.first.bytes!;

//       String base64Image = base64Encode(fileBytes);

//       final blob = html.Blob([base64Decode(base64Image)]);
//       final reader = html.FileReader();
//       // final file = File(await html.FileReader.readAsDataUrl(blob));

//       // return file;
//       reader.onLoadEnd.listen((e) async {
//         // Convert the result of reading to a base64 string
//         final base64String = reader.result as String;

//         // Convert the base64 string to bytes
//         final bytes = base64Decode(base64String.split(',').last);

//         // Create the File object from the bytes
//         final file = File('image.jpg');
//         await file.writeAsBytes(bytes);

//         // File creation completed, return the file
//         return file;
//       });

//       // Start reading the blob as a data URL
//       reader.readAsDataUrl(blob);
//     } else {
//       return null;
//     }
//   }

//   Future<void> _onAddPhotoClicked(context) async {
//     final image = await ImagePickerWeb.getImageAsWidget();
//     print(image);

//     if (image != null) {
//       setState(() {
//         _photo = image;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Flutter Image Web Page"),
//         actions: const [],
//       ),
//       body: Container(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             _photo != null
//                 ? Center(
//                     child: Container(
//                         margin: EdgeInsets.all(5),
//                         height: 100,
//                         width: 100,
//                         child: _photo),
//                   )
//                 : SizedBox(),
//             const SizedBox(
//               height: 24.0,
//             ),
//             Center(
//               child: GestureDetector(
//                 onTap: () => _onAddPhotoClicked(context),
//                 child: Container(
//                   margin: EdgeInsets.all(5),
//                   height: 100,
//                   width: 100,
//                   child: Center(
//                     child: Icon(
//                       Icons.add_to_photos,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
