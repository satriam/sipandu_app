import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

FontWeight light = FontWeight.w300;
FontWeight reguler = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;

class TextStyleConstant {
  static TextStyle textPurple =
      GoogleFonts.poppins(color: ColorConstant.purple);
  static TextStyle textBlack = GoogleFonts.poppins(color: ColorConstant.black);
  static TextStyle textYellow =
      GoogleFonts.poppins(color: ColorConstant.yellow);
  static TextStyle textWhite = GoogleFonts.poppins(color: ColorConstant.white);
  static TextStyle textRed = GoogleFonts.poppins(color: ColorConstant.red);
  static TextStyle textBlue = GoogleFonts.poppins(color: ColorConstant.blue);
}

class ColorConstant {
  static const Color purple = Color(0xFF8C52FF);
  static const Color black = Color(0xFF000000);
  static const Color yellow = Color(0xFFF0CB0A);
  static const Color white = Color(0xFFFFFFFF);
  static const Color red = Color(0xFFFF5252);
  static const Color blue = Color(0xff4F8CF6);
}

class ButtonWidget extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final Color? color;
  const ButtonWidget({
    Key? key,
    required this.child,
    this.onPressed,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(12),
          ),
          child: child),
    );
  }
}
