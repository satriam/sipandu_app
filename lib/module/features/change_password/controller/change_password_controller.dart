import 'package:SiPandu/core.dart';
import 'package:SiPandu/module/features/change_password/view/change_password_view.dart';
import 'package:SiPandu/service/service_change_password/change_password_service.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangePasswordController extends State<ChangePasswordView> {
  static late ChangePasswordController instance;
  late ChangePasswordView view;

  String? currentPassword;
  String? newPassword;
  String? confirmPassword;

  @override
  void initState() {
    instance = this;
    RefreshTokenService().refreshToken();
    getmemory();
    super.initState();
  }

  int? id_user;

  @override
  void dispose() => super.dispose();

  getmemory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    id_user = prefs.getInt('id_user');
  }

  dosave() async {
    bool isValid = formKey.currentState!.validate();
    print(currentPassword);
    if (!isValid) {
      return;
    }
    try {
      await ChangePassword().post(
          currentPassword: currentPassword!,
          newPassword: newPassword!,
          passwordConfirmation: confirmPassword!);

      AwesomeDialog(
        context: context,
        dialogType: DialogType.success,
        headerAnimationLoop: false,
        animType: AnimType.topSlide,
        title: 'Berhasil',
        desc: 'Berhasil Mengubah Password',
        btnOkOnPress: () => doLogout(),
      ).show();
    } catch (e) {
      AwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          headerAnimationLoop: false,
          animType: AnimType.topSlide,
          title: 'Error',
          desc: 'Password Saat Ini Salah!',
          btnOkOnPress: () => "").show();
    }
  }

  void onCurrentPasswordChanged(String value) {
    currentPassword = value;
  }

  void onNewPasswordChanged(String value) {
    newPassword = value;
  }

  void onConfirmPasswordChanged(String value) {
    confirmPassword = value;
  }

  doLogout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    await prefs.remove('role');

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LoginView()),
      (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
}
