import 'package:flutter/material.dart';
import '../theming/assets.dart';

// Font
const String poppinsFontFamily = 'Poppins';

// Theme
const String themeKey = 'appTheme';

// Locals
const englishLocale = Locale('en', 'US');
const arabicLocale  = Locale('ar', 'EG');

// Shared Preferences
const String localeKey = 'locale';
const String isSignedIn = 'is_logged_in';
const String isSignedUp = 'is_logged_up';
const String token      = 'token';

// Key Of Dragons Data At Local Database
const String dragonsKey = 'CACHED_DRAGONS';
// Key Of Rockets Data At Local Database
const String rocketsKey = 'CACHED_ROCKETS';
// Key Of Landpods Data At Local Database
const String landpodsKey = 'CACHED_LandpodS';

// Title Images In Home Screen
List<String> cardName = ['Rockets', 'Dragons', 'Landpods'];

// Images Of Home In Dark Mode
List<String> imageName = [AppAssets.rockets, AppAssets.galaxy, AppAssets.insightfulImage];

// Images Of Home In Light Mode
List<String> imageNameLightMode = [AppAssets.rocketsLightMode, AppAssets.galaxy, AppAssets.insightfulLightModeImage];

