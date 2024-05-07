// import 'package:flutter/material.dart';
// import 'package:m7_livelyness_detection/m7_livelyness_detection.dart';
// import 'dart:developer';
// import 'dart:io';

// // class LivenessCam extends StatefulWidget {
// //   const LivenessCam({Key? key}) : super(key: key);

// //   @override
// //   State<LivenessCam> createState() => _LivenessCamState();
// // }

// // class _LivenessCamState extends State<LivenessCam> {
// //   final _livenessCam = LivenessCam();

// //   File? result;

// //   @override
// //   void initState() {
// //     super.initState();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       home: Scaffold(
// //         appBar: AppBar(title: const Text('Liveness Cam')),
// //         body: Center(
// //           child: Column(
// //             children: [
// //               result != null ? Image.file(result!) : Container(),
// //               const SizedBox(
// //                 height: 20,
// //               ),
// //               Builder(builder: (context) {
// //                 return ElevatedButton(
// //                     onPressed: () {
// //                       _livenessCam.start(context).then((value) {
// //                         if (value != null) {
// //                           setState(() {
// //                             result = value;
// //                           });
// //                         }
// //                       });
// //                     },
// //                     child: const Text(
// //                       "Start",
// //                       style: TextStyle(fontSize: 19),
// //                     ));
// //               })
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// class LivenessPage extends StatefulWidget {
//   const LivenessPage({super.key});

//   @override
//   State<LivenessPage> createState() => _LivenessPageState();
// }

// class _LivenessPageState extends State<LivenessPage> {
//   String? imagePath;
//   m7Picture() async {
//     setState(() => imagePath = null);
//     log('start:1');
//     final String? response =
//         await M7LivelynessDetection.instance.detectLivelyness(
//       context,
//       config: M7DetectionConfig(
//         steps: [
//           M7LivelynessStepItem(
//             step: M7LivelynessStep.blink,
//             title: "Blink",
//             isCompleted: false,
//           ),
//           M7LivelynessStepItem(
//             step: M7LivelynessStep.smile,
//             title: "Smile",
//             isCompleted: false,
//           ),
//           // M7LivelynessStepItem(
//           //   step: M7LivelynessStep.turnLeft,
//           //   title: "Left",
//           //   isCompleted: false,
//           // ),
//           // M7LivelynessStepItem(
//           //   step: M7LivelynessStep.turnRight,
//           //   title: "Right",
//           //   isCompleted: false,
//           // ),
//         ],
//         startWithInfoScreen: true,
//         captureButtonColor: Colors.red,
//       ),
//     );
//     if (response == null) {
//       return;
//     }
//     setState(
//       () => imagePath = response.toString(),
//     );
//     log('IMage: $imagePath');
//     log('start:${response.toString}');
//     log('start:2');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         padding: const EdgeInsets.all(20.0),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const Text(
//                 "M7 Testing",
//                 style: TextStyle(
//                   fontSize: 20.0,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(
//                 height: 12.0,
//               ),
//               imagePath == null
//                   ? const Center(child: CircularProgressIndicator())
//                   : Visibility(
//                       visible: imagePath != null,
//                       child: Expanded(
//                         flex: 7,
//                         child: Image.file(
//                           File(imagePath ?? ""),
//                           fit: BoxFit.contain,
//                         ),
//                       ),
//                     ),
//               const SizedBox(
//                 height: 24.0,
//               ),
//               ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.blueGrey,
//                 ),
//                 onPressed: () => m7Picture(),
//                 child: const Text("Save"),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
