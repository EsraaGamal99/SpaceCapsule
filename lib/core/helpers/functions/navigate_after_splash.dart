import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:space_app/core/helpers/constants.dart';
import 'package:space_app/core/routing/routes.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

// checkToken() async {
//   print('checkToken   ${_auth.currentUser}');
//   if(_auth.currentUser != null) {
//     return true;
//   } else {
//     print('checkToken else  ${_auth.currentUser}');
//
//     await _auth.signOut();
//     return false;
//   }
// }
Future<bool> checkTokenAndSignOut() async {
  try {
    final currentUser = _auth.currentUser;
    if (currentUser != null) {
      return true;
    } else {
      await _auth.signOut();
      return false;
    }
  } catch (e) {
    print('Error during sign-out: $e');
    return false;
  }
}
Future<bool> checkToken() async {
  try {
    print('checkToken   ${_auth.currentUser}');
    final currentUser = _auth.currentUser;
    if (currentUser != null) {
      return true;
    } else {
      await _auth.signOut();
      print('checkToken else after  ${currentUser}');

      return false;
    }
  } catch (e) {
    print('Error during sign-out: $e');
    return false;
  }
}


Future<void> saveLogInStatus(bool isLoggedIn) async {
  final prefs = await SharedPreferences.getInstance();
  if(_auth.currentUser != null) {
    await prefs.setBool(isSignedIn, isLoggedIn);
  } else {
    await prefs.setBool(isSignedIn, false);
    _auth.signOut();
  }
}

Future<void> saveSignUpStatus(bool isLoggedUp) async {
  final prefs = await SharedPreferences.getInstance();
  if(_auth.currentUser != null) {
    await prefs.setBool(isSignedUp, isLoggedUp);
  } else {
    await prefs.setBool(isSignedUp, false);
    _auth.signOut();
  }
}


void navigateAfterSplash(BuildContext context) async {
  final prefs = await SharedPreferences.getInstance();
  bool? isLoggedIn = prefs.getBool(isSignedIn);
  bool? isLoggedUp = prefs.getBool(isSignedUp);
  if(isLoggedIn == true) {
    Navigator.pushReplacementNamed(context, Routes.homeScreen);
  } else if (isLoggedUp == true) {
    Navigator.pushReplacementNamed(context, Routes.loginScreen);
  } else {
    _auth.signOut();
    Navigator.pushReplacementNamed(context, Routes.firstOnboardingScreen);
  }
}