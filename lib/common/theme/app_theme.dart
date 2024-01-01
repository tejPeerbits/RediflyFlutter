import 'package:flutter/material.dart';

import '../core/app_colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    datePickerTheme: const DatePickerThemeData(backgroundColor: Colors.white),
    scaffoldBackgroundColor: AppColors.primaryColor,
    brightness: Brightness.light,
    dialogBackgroundColor: AppColors.primaryColor
  );


  static ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.primaryColor,
      brightness: Brightness.dark
  );
}
