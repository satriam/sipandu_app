import 'package:SiPandu/module/register/view/register_view.dart';
import 'package:flutter/material.dart';
import 'package:SiPandu/core.dart';

class RegisterController extends State<RegisterView> {
  static late RegisterController instance;
  late RegisterView view;
  late bool obscureText;
  double passwordStrength = 0;

  @override
  void initState() {
    instance = this;
    super.initState();
    obscureText = true;
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
}
