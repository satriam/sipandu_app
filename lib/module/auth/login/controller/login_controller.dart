import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/module/auth/login/service/login_service.dart';
// import 'package:hyper_ui/module/dashboard/view/main_navigation_view.dart'; // Import your MainNavigationView
import 'package:shared_preferences/shared_preferences.dart'; // Import shared_preferences
import 'package:hyper_ui/shared/util/url_api/url_api.dart';
import '../view/login_view.dart';

class LoginController extends State<LoginView> {
  static late LoginController instance;
  late LoginView view;

  @override
  void initState() {
    instance = this;
    super.initState();
    checkTokenAndNavigate(); // Check token on initialization
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
    print(result.code);
    if (result.success) {
      final snackbar = SnackBar(content: Text('Sukses Login'));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);

      // Save token to shared preferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('token', ApiUrl.token ?? "");

      Get.offAll(MainNavigationView());
    } else {
      // Check if the error message indicates invalid identifier or password
      if (result.code == "500") {
        await showDialog<void>(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Warning'),
              content: const SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text('Your email or password is incorrect.'),
                  ],
                ),
              ),
              actions: <Widget>[
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Ok"),
                ),
              ],
            );
          },
        );
      } else {
        // Handle other server errors
        await showDialog<void>(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Error'),
              content: const SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text(
                        'Sorry, the server is currently unavailable. Please try again later.'),
                  ],
                ),
              ),
              actions: <Widget>[
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Ok"),
                ),
              ],
            );
          },
        );
      }
    }
  }
}
