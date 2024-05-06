import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:space_app/core/helpers/constants.dart';
import 'package:space_app/core/helpers/functions/firebase_services.dart';
import 'package:space_app/core/routing/routes.dart';

void navigateAfterSplash(BuildContext context) async {
  final prefs = await SharedPreferences.getInstance();
  bool? isLoggedIn = prefs.getBool(isSignedIn);
  bool? isLoggedUp = prefs.getBool(isSignedUp);
  String? currentToken = await getToken();
  debugPrint('isLoggedIn: $isLoggedIn');
  debugPrint('isLoggedUp: $isLoggedUp');
  debugPrint('currentToken: $currentToken');
  if(isLoggedIn == true && currentToken != null && currentToken.isNotEmpty) {
    Navigator.pushReplacementNamed(context, Routes.homeScreen);
  } else if (isLoggedUp == true && currentToken != null && currentToken.isNotEmpty) {
    Navigator.pushReplacementNamed(context, Routes.loginScreen);
  } else {
    Navigator.pushReplacementNamed(context, Routes.firstOnboardingScreen);
  }
}
