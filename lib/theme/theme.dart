import 'package:flutter/material.dart';

const montserrat = "Montserrat";

class PromiloTheme {
  static TextTheme darkTextTheme = const TextTheme();
  static ThemeData light() {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: whiteColor,
      fontFamily: montserrat,
      primaryColor: blueColor,
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: blueColor
      )
      // snackBarTheme: const SnackBarThemeData(
      //   backgroundColor: PromiloTheme.blueColor
      // )
    );
  }

  static const whiteColor = Color(0xffffffff);
  static const blueColor = Color(0xff006196);
  static const darkBlueColor = Color(0xff002a40);
  static const darkGreyColor = Color(0xFF737070);
  static const blackColor = Color(0xff000000);
  static const blueGrey = Color(0xff7f949f);
  static const lightGrey = Color(0xff8e8e8e);
  static const lightGrey2 = Color(0xffe0e0e0);
  static const skyBlue = Color(0xff32dae2);
}

//Text style
const TextStyle mon14Blue700 = TextStyle(
  fontFamily: montserrat,
  fontSize: 14,
  fontWeight: FontWeight.w700,
  color: PromiloTheme.blueColor,
);
const TextStyle mon14Blue500 = TextStyle(
  fontFamily: montserrat,
  fontSize: 14,
  fontWeight: FontWeight.w500,
  color: PromiloTheme.blueColor,
);

const TextStyle mon16DarkBlue700 = TextStyle(
  fontFamily: montserrat,
  fontSize: 16,
  fontWeight: FontWeight.w700,
  color: PromiloTheme.darkBlueColor,
);

const TextStyle mon14Grey500 = TextStyle(
  fontFamily: montserrat,
  fontSize: 14,
  fontWeight: FontWeight.w500,
  color: PromiloTheme.darkGreyColor,
);

const TextStyle mon16black700 = TextStyle(
  fontFamily: montserrat,
  fontSize: 16,
  fontWeight: FontWeight.w700,
  color: PromiloTheme.blackColor,
);

const TextStyle mon16white700 = TextStyle(
  fontFamily: montserrat,
  fontSize: 16,
  fontWeight: FontWeight.w700,
  color: PromiloTheme.whiteColor,
);

const TextStyle mon20black700 = TextStyle(
  fontFamily: montserrat,
  fontSize: 20,
  fontWeight: FontWeight.w700,
  color: PromiloTheme.blackColor,
);

const TextStyle mon20darkBlue700 = TextStyle(
  fontFamily: montserrat,
  fontSize: 20,
  fontWeight: FontWeight.w700,
  color: PromiloTheme.darkBlueColor,
);

const TextStyle mon12black500 = TextStyle(
  fontFamily: montserrat,
  fontSize: 12,
  fontWeight: FontWeight.w500,
  color: PromiloTheme.blackColor,
);

const TextStyle mon12grey500 = TextStyle(
  fontFamily: montserrat,
  fontSize: 12,
  fontWeight: FontWeight.w500,
  color: PromiloTheme.darkGreyColor,
);

const TextStyle mon12white500 = TextStyle(
  fontFamily: montserrat,
  fontSize: 12,
  fontWeight: FontWeight.w500,
  color: PromiloTheme.whiteColor,
);


