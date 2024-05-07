import 'package:flutter/material.dart';

import 'package:hyper_ui/core.dart';
// import 'package:web_socket_channel/io.dart';
import 'dependency_injection.dart';
import 'package:permission_handler/permission_handler.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MainApp());
  await requestPermission();
  DependencyInjection.init();
}

Future<void> requestPermission() async {
  // Meminta izin akses ke penyimpanan eksternal
  // final PermissionStatus status = await Permission.storage.request();

  // if (status.isGranted) {
  //   // Izin diberikan, Anda dapat melanjutkan dengan logika aplikasi Anda di sini
  //   print("Permission Granted");
  // } else if (status.isDenied) {
  //   // Izin ditolak
  //   print("Permission Denied");
  // } else if (status.isPermanentlyDenied) {
  //   // Izin ditolak secara permanen, arahkan pengguna untuk mengaktifkannya di pengaturan
  //   print("Permission Permanently Denied");
  // }
}

class MainApp extends StatelessWidget {
  final permissionPhotos = Permission.photos;
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
