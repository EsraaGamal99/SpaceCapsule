import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:space_app/core/helpers/constants.dart';
import 'package:space_app/core/helpers/functions/firebase_services.dart';
import 'package:space_app/core/routing/routes.dart';

void navigateAfterSplash(BuildContext context) async {
  final prefs = await SharedPreferences.getInstance();
  bool? isLoggedIn = prefs.getBool(isSignedIn);
  bool? isLoggedUp = prefs.getBool(isSignedUp);
  bool? isOnBoardingSkipped = prefs.getBool(onBoardingKey);
  bool? isWelcomeSkipped = prefs.getBool(welcomeSkipped);
  String? currentToken = await getToken();
  if(isOnBoardingSkipped == false) {
    Navigator.pushNamedAndRemoveUntil(context, Routes.firstOnboardingScreen, (route) => false);
  }
  else if(isLoggedIn == true && currentToken != null ) {
    Navigator.pushNamedAndRemoveUntil(context, Routes.homeScreen, (route) => false);
  } else if (isLoggedUp == true && currentToken != null) {
    Navigator.pushNamedAndRemoveUntil(context, Routes.loginScreen, (route) => false,arguments: isLoggedUp);
  } else if((isLoggedIn == true && isLoggedUp == true && currentToken == null) || (isWelcomeSkipped == true && isWelcomeSkipped != null)) {
    Navigator.pushNamedAndRemoveUntil(context, Routes.registerScreen, (route) => false);

    //Navigator.pushReplacementNamed(context, Routes.registerScreen);
  } else {
    Navigator.pushNamedAndRemoveUntil(context, Routes.firstOnboardingScreen, (route) => false);

  //  Navigator.pushReplacementNamed(context, Routes.firstOnboardingScreen);
  }
}
