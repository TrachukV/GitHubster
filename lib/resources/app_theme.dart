import 'package:flutter/material.dart';
import 'package:githubster/resources/app_colors.dart';
import 'package:githubster/resources/app_styles.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.main,
    appBarTheme: AppBarTheme(
      elevation: 0.0,
      backgroundColor: AppColors.main,
      titleTextStyle: AppStyles.header,
      centerTitle: true,
      shadowColor: AppColors.layer,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      fillColor: AppColors.layer,
      filled: true,
      contentPadding: EdgeInsets.all(16.0),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(
          Radius.circular(30.0),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.accentPrimary,
          width: 2.0,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(30.0),
        ),
      ),
    ),
  );
}
