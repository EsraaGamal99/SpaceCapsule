import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:space_app/core/theming/colors.dart';

class AppThemes {
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.primarySoftGreyColor,
    primaryColor: AppColors.primaryWhiteColor,
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      background: AppColors.primarySoftGreyColor,
      primary: AppColors.primaryBlackColor,
      secondary: AppColors.primaryBlueColor,
    ),
    appBarTheme: const AppBarTheme(
      foregroundColor: Colors.black,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
      ),
    ),
  );
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.primaryBlackColor,
    primaryColor: AppColors.primaryBlackColor,
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      background: AppColors.primaryBlackColor,
      secondary: AppColors.primaryWhiteColor,
      primary: AppColors.primaryWhiteColor,
    ),
    appBarTheme: const AppBarTheme(
      foregroundColor: Colors.white,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
      ),
    ),
  );
}
