import 'package:flutter/material.dart';
import 'package:SiPandu/core.dart';
import 'package:get/get.dart';

class ProfileFormView extends StatelessWidget {
  const ProfileFormView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileFormController>(
      init: ProfileFormController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: const Text("ProfileForm"),
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  QImagePicker(
                    label: "Photo",
                    validator: Validator.required,
                    value: null,
                    onChanged: (value) {},
                  ),
                  QTextField(
                    label: "Name",
                    validator: Validator.required,
                    value: null,
                    onChanged: (value) {},
                  ),
                  QTextField(
                    label: "Jabatan",
                    validator: Validator.required,
                    value: null,
                    onChanged: (value) {},
                  ),
                  QNumberField(
                    label: "Nomor Pegawai",
                    validator: Validator.required,
                    value: null,
                    onChanged: (value) {},
                  ),
                  QTextField(
                      label: "Email",
                      validator: Validator.email,
                      value: null,
                      onChanged: (value) {}),
                  QDropdownField(
                    label: "Roles",
                    validator: Validator.required,
                    items: [
                      {
                        "label": "Admin",
                        "value": "Admin",
                      },
                      {
                        "label": "Staff",
                        "value": "Staff",
                      }
                    ],
                    value: "Admin",
                    onChanged: (value, label) {},
                  ),
                  QButton(
                    label: "Save",
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
