import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyle {
  AppTextStyle._();

  static TextStyle appTextStyleH1(BuildContext context) {
    double fontSize = MediaQuery.of(context).size.width > 600 ? 12.sp : 18.sp;
    return TextStyle(
      color: Colors.white,
      fontSize: fontSize,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle appTextStyleRegular(BuildContext context) {
    double fontSize = MediaQuery.of(context).size.width > 600 ? 10.sp : 14.sp;
    return TextStyle(
      color: Colors.white,
      fontSize: fontSize,
    );
  }

  static TextStyle appTextStyleSmall(BuildContext context) {
    double fontSize = MediaQuery.of(context).size.width > 600 ? 7.sp : 12.sp;
    return TextStyle(
      color: Colors.white,
      fontSize: fontSize,
    );
  }

  static TextStyle appTextStyleVerySmall(BuildContext context) {
    double fontSize = MediaQuery.of(context).size.width > 600 ? 5.sp : 9.sp;
    return TextStyle(
      color: Colors.white,
      fontSize: fontSize,
    );
  }

  static TextStyle appTextStyleH2(BuildContext context) {
    double fontSize = MediaQuery.of(context).size.width > 600 ? 11.sp : 13.sp;
    return TextStyle(
      color: Colors.white,
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle appTextStyleH3(BuildContext context) {
    double fontSize = MediaQuery.of(context).size.width > 600 ? 10.sp : 12.sp;
    return TextStyle(
      color: Colors.white,
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
    );
  }

  // static TextStyle appTextStyleH1 = TextStyle(
  //     color: Colors.white, fontSize: 18.sp, fontWeight: FontWeight.w500);

  // static TextStyle appTextStyleRegular =
  //     TextStyle(color: Colors.white, fontSize: 14.sp);
  //
  // static TextStyle appTextStyleSmall =
  //     TextStyle(color: Colors.white, fontSize: 12.sp);
  //
  // static TextStyle appTextStyleVerySmall =
  //     TextStyle(color: Colors.white, fontSize: 9.sp);
}
