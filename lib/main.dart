import 'package:flutter/material.dart';

import 'package:hyper_ui/core.dart';
// import 'package:web_socket_channel/io.dart';
import 'dependency_injection.dart';
import 'package:permission_handler/permission_handler.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MainApp());
  // await requestPermission();
  DependencyInjection.init();
}

Future<void> requestPermission() async {
  for (var permission in [
    Permission.photos,
    Permission.camera,
    Permission.location
  ]) {
    var status = await permission.request();
    if (status.isGranted) {
      //isGranted!
      print("granted");
    } else if (status.isPermanentlyDenied) {
      openAppSettings();
    }
  }
}

class MainApp extends StatelessWidget {
  // final permissionPhotos = Permission.photos;
  // final Talker talker;
  const MainApp({
    Key? key,
    // required this.talker,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    requestPermission();

    return MaterialApp(
      navigatorKey: Get.navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: getDefaultTheme(),
      home: LoginView(),
    );
  }
}
