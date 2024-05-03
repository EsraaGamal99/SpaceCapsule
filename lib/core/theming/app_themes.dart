import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:space_app/core/theming/colors.dart';

class AppThemes {
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.primaryMoreLightGreyColor,
    primaryColor: AppColors.primaryWhiteColor,
    cardColor: AppColors.primaryMoreLightGreyColor,
    focusColor: AppColors.primaryMediumGrayColor,
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      background: AppColors.primarySoftGreyColor,
      primary: AppColors.primaryBlackColor,
      secondary: AppColors.primaryBlueColor,
      surface: AppColors.primaryWhiteColor,

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
    cardColor: AppColors.primaryMidnightGreyColor,

    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      background: AppColors.primaryBlackColor,
      secondary: AppColors.primaryWhiteColor,
      primary: AppColors.primaryWhiteColor,
      surface: AppColors.primarySoftGreyColor,
    ),
    appBarTheme: const AppBarTheme(
      foregroundColor: Colors.white,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
      ),
    ),
  );
}
