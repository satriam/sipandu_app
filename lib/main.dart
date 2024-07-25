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
  // await AwesomeNotifications().initialize(null, [
  //   NotificationChannel(
  //       channelKey: "notification_channel",
  //       channelName: "default",
  //       channelDescription: 'default',
  //       channelGroupKey: "notification_group"),
  // ], channelGroups: [
  //   NotificationChannelGroup(
  //     channelGroupKey: "notification_channel",
  //     channelGroupName: "default",
  //   )
  // ]);
  // bool isAllowedNotification =
  //     await AwesomeNotifications().isNotificationAllowed();
  // if (!isAllowedNotification) {
  //   AwesomeNotifications().requestPermissionToSendNotifications();
  // }

  runApp(MainApp());
  DependencyInjection.init();
  // await NotificationService().getToken();
  // if (NetworkController().jwtOrEmpty != null) {
  await RefreshTokenService().refreshToken();
  // }
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

// class LoadingScreen extends StatefulWidget {
//   const LoadingScreen({Key? key}) : super(key: key);

//   @override
//   _LoadingScreenState createState() => _LoadingScreenState();
// }

// class _LoadingScreenState extends State<LoadingScreen> {
//   @override
//   void initState() {
//     super.initState();
//     _navigateToNextScreen();
//   }

//   Future<void> _navigateToNextScreen() async {
//     await Future.delayed(const Duration(seconds: 2));
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(
//           builder: (context) =>
//               const LoginView()), // Replace LoginView with your next widget
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         padding: const EdgeInsets.all(10.0),
//         width: MediaQuery.of(context).size.width,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset(
//               'assets/icon/rehandling.png',
//               fit: BoxFit.cover,
//             ),
//             const SizedBox(height: 20.0),
//             const CircularProgressIndicator(),
//           ],
//         ),
//       ),
//     );
//   }
// }
