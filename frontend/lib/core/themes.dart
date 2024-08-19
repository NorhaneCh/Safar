import 'package:flutter/material.dart';
import 'package:frontend/core/colors.dart';

class Themes {
  static final ThemeData kLightTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.kWhiteColor,
    ),
    scaffoldBackgroundColor: AppColors.kWhiteColor,
    primaryColor: AppColors.kPrimaryColor,
    colorScheme: const ColorScheme.light(
      primary: AppColors.kPrimaryColor,
      onPrimary: AppColors.kWhiteColor,
      secondary: AppColors.kSecondaryColor,
      onSecondary: AppColors.kWhiteColor,
      surface: AppColors.kWhiteColor,
      onSurface: AppColors.kDarkColor,
      brightness: Brightness.light,
    ),
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    hoverColor: Colors.transparent,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.kWhiteColor,
      elevation: 0,
      unselectedItemColor: AppColors.kFourthColor,
      selectedItemColor: AppColors.kSecondaryColor,
      type: BottomNavigationBarType.fixed,
    ),
    fontFamily: 'Poppins',
  );
}
