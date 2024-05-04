import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:space_app/core/helpers/functions/firebase_services.dart';
import 'package:space_app/core/helpers/functions/navigate_after_splash.dart';
import 'package:space_app/core/networking/firebase_service/firebase_auth_error_handler/firebase_auth_error-handler.dart';
import 'package:space_app/core/networking/firebase_service/firebase_result.dart';
import 'package:space_app/core/networking/general_error_handler.dart';

import 'models/login_model.dart';
import 'models/register_model.dart';

class AuthRepo {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<FirebaseResult<AuthResultStatus>> logIn(LoginModel loginModel) async {
    try {
      final UserCredential response = await _auth.signInWithEmailAndPassword(
        email: loginModel.email,
        password: loginModel.password,
      );
      if (response.user != null) {
        debugPrint('=========================${response.user}=========================');
        storeToken(response);
        debugPrint('==${response}');
        await saveLogInStatus(true);
        return const FirebaseResult.success(AuthResultStatus.successful);
      } else {
        return FirebaseResult.failure(
            Handler.handle(ErrorHandlerAuth(AuthResultStatus.unknown)));
      }
    } catch (error) {
      return FirebaseResult.failure(Handler.handle(ErrorHandlerAuth(error)));
    }
  }

  Future<FirebaseResult<AuthResultStatus>> register(RegisterModel registerModel) async {
    try {
      final UserCredential response = await _auth.createUserWithEmailAndPassword(
        email: registerModel.email,
        password: registerModel.password,
      );

      if (response.user != null) {
        debugPrint('=========================${response.user}=========================');
        await response.user!.updateDisplayName(registerModel.name);
        storeToken(response);
        await saveSignUpStatus(true);
        return const FirebaseResult.success(AuthResultStatus.successful);
      } else {
        return FirebaseResult.failure(
            Handler.handle(ErrorHandlerAuth(AuthResultStatus.unknown)));
      }
    } catch (error) {
      return FirebaseResult.failure(Handler.handle(ErrorHandlerAuth(error)));
    }
  }
}
