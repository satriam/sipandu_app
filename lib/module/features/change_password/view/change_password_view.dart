import 'package:flutter/material.dart';
import 'package:SiPandu/core.dart';

class ChangePasswordView extends StatefulWidget {
  final Map? item;
  const ChangePasswordView({Key? key, this.item}) : super(key: key);

  Widget build(context, ChangePasswordController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("News Post"),
        actions: [],
      ),
      body: SingleChildScrollView(
          child: Container(
              padding: const EdgeInsets.all(10.0),
              child: Form(
                key: controller.formKey,
                child: Column(children: [
                  QTextField(
                    label: "Password Saat Ini",
                    obscure: true,
                    validator: Validator.required,
                    suffixIcon: Icons.password,
                    value: null,
                    onChanged: controller.onCurrentPasswordChanged,
                  ),
                  QTextField(
                    label: "Password Baru",
                    obscure: true,
                    validator: Validator.required,
                    suffixIcon: Icons.password,
                    value: null,
                    onChanged: controller.onNewPasswordChanged,
                  ),
                  QTextField(
                    label: "Konfirmasi Password",
                    obscure: true,
                    validator: (value) => Validator.validateConfirmPassword(
                        value, controller.newPassword),
                    suffixIcon: Icons.password,
                    value: null,
                    onChanged: controller.onConfirmPasswordChanged,
                  ),
                ]),
              ))),
      bottomNavigationBar: QActionButton(
        label: "Submit",
        onPressed: () {
          controller.dosave();
        },
      ),
    );
  }

  @override
  State<ChangePasswordView> createState() => ChangePasswordController();
}
