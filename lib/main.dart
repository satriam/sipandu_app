// import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:SiPandu/core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await NotificationService().initNotifications();

  runApp(MainApp());
  DependencyInjection.init();
  await RefreshTokenService().refreshToken();
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Jika tidak ada error, tampilkan LoginView
    return MaterialApp(
      navigatorKey: Get.navigatorKey, // Mengatur navigatorKey untuk Get kustom
      debugShowCheckedModeBanner: false,
      theme: getDefaultTheme(),

      home: LoginView(),
    );
  }
}
