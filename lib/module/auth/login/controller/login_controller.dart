import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:SiPandu/core.dart';
// import 'package:hyper_ui/module/dashboard/view/main_navigation_view.dart'; // Import your MainNavigationView
import 'package:shared_preferences/shared_preferences.dart'; // Import shared_preferences

class LoginController extends State<LoginView> {
  static late LoginController instance;
  late LoginView view;
  late bool obscureText;
  double passwordStrength = 0;

  @override
  void initState() {
    instance = this;
    super.initState();
    obscureText = true;
    checkTokenAndNavigate(); // Check token on initialization
  }

  void toggleObscureText() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? email;
  String? password;

  Future<void> checkTokenAndNavigate() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    if (token != null && token.isNotEmpty) {
      // If token exists, navigate to dashboard
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => MainNavigationView(),
        ),
      );
    }
  }

  void checkPasswordStrength(String password) {
    int strength = 0;

    if (password.contains(RegExp(r'[a-z]'))) strength++;
    if (password.contains(RegExp(r'[A-Z]'))) strength++;
    if (password.contains(RegExp(r'[0-9]'))) strength++;
    if (password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) strength++;

    if (password.length >= 8) {
      passwordStrength = (strength / 4).clamp(0.0, 1.0);
    } else {
      passwordStrength =
          (strength / 4 * 0.5).clamp(0.0, 1.0); // Penalize for short length
    }

    setState(() {});
  }

  doLogin() async {
    bool isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    showLoading();
    final result = await LoginService().login(
      email: email!,
      password: password!,
    );

    hideLoading();
    // print(result.code);
    if (result.success && result.confirmed == true) {
      AwesomeDialog(
          context: context,
          dialogType: DialogType.success,
          headerAnimationLoop: true,
          animType: AnimType.topSlide,
          title: 'Berhasil Login',
          desc: 'Selamat Beraktivitas ${ApiUrl.name}',
          dismissOnTouchOutside: false,
          dismissOnBackKeyPress: false,
          btnOkOnPress: () => Get.offAll(MainNavigationView())).show();

      // Save token to shared preferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('token', ApiUrl.token ?? "");
      prefs.setString('role', ApiUrl.role_job ?? "");
      prefs.setInt('id_user', ApiUrl.id);
      prefs.setString('nama', ApiUrl.name ?? "");
      prefs.setString('grup', ApiUrl.grup ?? "");
    } else if (result.success && result.confirmed == false) {
      AwesomeDialog(
              context: context,
              dialogType: DialogType.error,
              headerAnimationLoop: true,
              animType: AnimType.topSlide,
              title: 'Gagal Login',
              desc: 'Akun Belum Dikonfirmasi',
              btnOkOnPress: () {})
          .show();
    } else {
      // Check if the error message indicates invalid identifier or password
      if (result.code == "500") {
        AwesomeDialog(
                context: context,
                dialogType: DialogType.error,
                headerAnimationLoop: true,
                animType: AnimType.topSlide,
                title: 'Gagal Login',
                desc: 'Email / Password salah!',
                btnOkOnPress: () {})
            .show();
      } else {
        // Handle other server errors
        AwesomeDialog(
                context: context,
                dialogType: DialogType.error,
                headerAnimationLoop: true,
                animType: AnimType.topSlide,
                title: 'Error',
                desc: 'Server / jaringan bermasalah!',
                btnOkOnPress: () {})
            .show();
      }
    }
  }
}
