
import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static final ThemeData _lightThemeData = ThemeData(
    colorSchemeSeed: AppColors.themeColor,
    scaffoldBackgroundColor: Colors.white,
    progressIndicatorTheme: _progressIndicatorThemeData,

  );
  static final ThemeData _darkThemeData =  ThemeData(
    colorSchemeSeed: AppColors.themeColor,
    brightness: Brightness.dark,
    progressIndicatorTheme: _progressIndicatorThemeData,
  );


  static ProgressIndicatorThemeData get _progressIndicatorThemeData{
    return ProgressIndicatorThemeData(
      color: AppColors.themeColor
    );
  }

  static ThemeData get lightTheme =>_lightThemeData;
  static ThemeData get darkTheme => _darkThemeData;

}