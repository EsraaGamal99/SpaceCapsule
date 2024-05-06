import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:space_app/core/helpers/functions/firebase_services.dart';
import 'package:space_app/core/networking/firebase_service/firebase_auth_error_handler/firebase_auth_error-handler.dart';

class ProfileRepo {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void logout() async {
    await logOut();
  }

  updateEmail({required String email, required String password}) async {
    final user = _auth.currentUser;
    if(user != null) {
      await user.verifyBeforeUpdateEmail(email);
    }
  }

  updatePassword({required String password}) async {
    final user = _auth.currentUser;
    if(user != null) {
      await user.updatePassword(password);
    }
  }

  updateUsername({required String username}) async {
    final user = _auth.currentUser;
    if(user != null) {
      await user.updateDisplayName(username);
    }
  }

  updatePhoto({required String photoURL}) async {
    final user = _auth.currentUser;
    if(user != null) {
      await user.updatePhotoURL(photoURL);
    }
  }
}