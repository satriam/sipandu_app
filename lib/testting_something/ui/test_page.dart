import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hyper_ui/testting_something/ui/dimens.dart';
import 'package:hyper_ui/testting_something/ui/textstyel.dart';

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome to Login",
                  style: TextStyleConstant.textWhite.copyWith(
                    fontSize: 18.0,
                    color: Colors.white,
                    fontWeight: bold,
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                RichText(
                  text: TextSpan(
                    text:
                        'Please fill E-mail & password to login your app account ',
                    style: TextStyleConstant.textWhite,
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Sign Up',
                        style: TextStyleConstant.textYellow.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height / 4),
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(
                  12,
                ),
                topRight: Radius.circular(
                  12,
                ),
              ),
            ),
            padding: EdgeInsets.all(
              24,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "E-mail",
                  style: TextStyleConstant.textBlack.copyWith(
                    fontSize: 14.0,
                  ),
                ),
                TextFormFieldBorderWidget(
                  pleaceholder: 'Store@gmail.com',
                  controller: TextEditingController(),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Password",
                  style: TextStyleConstant.textBlack.copyWith(
                    fontSize: 14.0,
                  ),
                ),
                TextFormFieldBorderWidget(
                  pleaceholder: '********',
                  controller: TextEditingController(),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Forgot password?",
                    style: TextStyleConstant.textBlue.copyWith(
                      fontSize: 14.0,
                      fontWeight: bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24.0,
                ),
                ButtonWidget(
                  color: ColorConstant.yellow,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Text(
                        'Login Now',
                        style: TextStyleConstant.textBlack.copyWith(
                          fontSize: 14.0,
                          fontWeight: bold,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24.0,
                ),
                ButtonWidget(
                  color: ColorConstant.red,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Googl
                          Text(
                            'Sign Up',
                            style: TextStyleConstant.textWhite.copyWith(
                              fontSize: 14.0,
                              fontWeight: bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      )),
    );
  }
}

class TextFormFieldBorderWidget extends StatelessWidget {
  final TextEditingController controller;
  final String pleaceholder;
  final String? Function(String?)? validator;
  final bool? isReadOnly;

  const TextFormFieldBorderWidget({
    Key? key,
    required this.controller,
    required this.pleaceholder,
    this.validator,
    this.isReadOnly = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 16, 0, 0),
      child: TextFormField(
        readOnly: isReadOnly!,
        validator: validator,
        controller: controller,
        decoration: InputDecoration(
          hintText: pleaceholder,
          hintStyle: TextStyleConstant.textBlack.copyWith(
            fontSize: 16,
            fontWeight: medium,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Colors.grey,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: ColorConstant.blue,
            ),
          ),
        ),
      ),
    );
  }
}
