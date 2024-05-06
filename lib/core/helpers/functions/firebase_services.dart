import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:space_app/core/helpers/constants.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

void storeToken(UserCredential userCredential) async {
  final prefs = await SharedPreferences.getInstance();
  try {
    final currentUser = _auth.currentUser;
    if (currentUser != null) {
      final currentToken = await currentUser.getIdToken();
      if (currentToken != null) {
        await prefs.setString(token, currentToken);
        debugPrint('Token retrieval successful, proceed with storing the token $currentToken');
      } else {
          await _auth.signOut();
          await prefs.remove(token);
        debugPrint('ID token is null $currentToken');
      }
    } else {
    }

    // if (currentToken != null) {
    //   await prefs.setString(token, currentToken);
    //   debugPrint('checkToken if after  $currentToken');
    //   debugPrint('checkToken if after maCurrentToken $maCurrentToken');
    // } else {
    //   await _auth.signOut();
    //   await prefs.remove(token);
    //   debugPrint('checkToken else after  $currentToken');
    //   debugPrint('checkToken else after maCurrentToken ${maCurrentToken}');
    //   debugPrint('checkToken else after loginCurrentToken ${loginCurrentToken}');
    // }
  } catch (e) {
    debugPrint('Error during sign-out: $e');
  }
}

Future<String?> getToken() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString(token);
}

Future<User?> getUser() async {
  try {
    return await _auth.currentUser;
  } catch (e) {
    debugPrint('Error getting current user: $e');
    return null;
  }
}


logOut() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final token = await getToken();
  if(token != null && token.isNotEmpty) {
    await _auth.signOut();
    await prefs.remove(token);
    final tokenNew = await getToken();
    debugPrint('Token after sign out: $tokenNew');
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
