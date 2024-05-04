import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:space_app/core/networking/firebase_service/firebase_auth_error_handler/firebase_auth_error-handler.dart';

import '../../../core/networking/error_handler_base.dart';
import '../../../core/networking/result_handler.dart';
import 'models/login_model.dart';
import 'models/register_model.dart';

class AuthRepo {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<ResultHandler<AuthResultStatus>> logIn(LoginModel loginModel) async {
    try {
      final UserCredential response = await _auth.signInWithEmailAndPassword(
        email: loginModel.email,
        password: loginModel.password,
      );
      if (response.user != null) {
        debugPrint(
            '=========================${response.user}=========================');
        return const ResultHandler.success(AuthResultStatus.successful);
      } else {
        return ResultHandler.failure(
            ErrorHandler.handle(ErrorHandlerAuth(AuthResultStatus.unknown)));
      }
    } catch (error) {
      return ResultHandler.failure(ErrorHandler.handle(ErrorHandlerAuth(error)));
    }
  }

  Future<ResultHandler<AuthResultStatus>> register(
      RegisterModel registerModel) async {
    try {
      final UserCredential response =
          await _auth.createUserWithEmailAndPassword(
        email: registerModel.email,
        password: registerModel.password,
      );
      if (response.user != null) {
        debugPrint(
            '=========================${response.user}=========================');
        return const ResultHandler.success(AuthResultStatus.successful);
      } else {
        return ResultHandler.failure(
            ErrorHandler.handle(ErrorHandlerAuth(AuthResultStatus.unknown)));
      }
    } catch (error) {
      return ResultHandler.failure(ErrorHandler.handle(ErrorHandlerAuth(error)));
    }
  }
}
