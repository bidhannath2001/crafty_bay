
import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static final ThemeData _lightThemeData = ThemeData(
    colorSchemeSeed: AppColors.themeColor,
    scaffoldBackgroundColor: Colors.white,
    progressIndicatorTheme: _progressIndicatorThemeData,
    textTheme: _textTheme,
    inputDecorationTheme: _inputDecorationTheme,
    filledButtonTheme: _filledButtonTheme,
    appBarTheme: _appBarTheme
  );
  static final ThemeData _darkThemeData =  ThemeData(
    colorSchemeSeed: AppColors.themeColor,
    brightness: Brightness.dark,
    progressIndicatorTheme: _progressIndicatorThemeData,
    textTheme: _textTheme,
    inputDecorationTheme: _inputDecorationTheme,
      filledButtonTheme: _filledButtonTheme,
    appBarTheme: _appBarTheme
  );

  static TextTheme get _textTheme=> TextTheme(
    titleLarge: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold
    )
  );
 static AppBarTheme get _appBarTheme=> AppBarTheme(
   titleTextStyle: TextStyle(
     fontSize: 18,
     fontWeight: FontWeight.bold,
     color: AppColors.themeColor
   ),
 );

  static InputDecorationTheme get _inputDecorationTheme=>InputDecorationTheme(
    hintStyle: TextStyle(color: Colors.grey),
    contentPadding: EdgeInsets.symmetric(horizontal: 12,vertical: 0),
    border: OutlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.themeColor,
        width: 1,
      ),
      borderRadius: BorderRadius.circular(8),

    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.themeColor,
        width: 1,
      ),
      borderRadius: BorderRadius.circular(8),

    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
          color: AppColors.themeColor,
          width: 1
      ),
      borderRadius: BorderRadius.circular(8),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 1,
        color: Colors.red,
      ),
      borderRadius: BorderRadius.circular(8),
    ),
  );

  static ProgressIndicatorThemeData get _progressIndicatorThemeData{
    return ProgressIndicatorThemeData(
      color: AppColors.themeColor
    );
  }

  static FilledButtonThemeData get _filledButtonTheme=>FilledButtonThemeData(
    style: FilledButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      fixedSize: Size.fromWidth(double.maxFinite),
      padding: EdgeInsets.symmetric(vertical: 12),
      backgroundColor: AppColors.themeColor,
    ),
  );


  static ThemeData get lightTheme =>_lightThemeData;
  static ThemeData get darkTheme => _darkThemeData;

}