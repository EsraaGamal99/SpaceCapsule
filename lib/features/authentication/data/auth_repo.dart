import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:space_app/core/networking/firebase_service/firebase_auth_error_handler/firebase_auth_error-handler.dart';

import '../../../core/networking/error_handler_base.dart';
import '../../../core/networking/result_handler.dart';
import 'models/login_model.dart';
import 'models/register_model.dart';

class AuthRepo {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<ResultHandler<AuthResultStatus>> logIn(BuildContext context, LoginModel loginModel) async {
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
            ErrorHandler.handle(context, ErrorHandlerAuth(context: context, AuthResultStatus.unknown)));
      }
    } catch (error) {
      return ResultHandler.failure(ErrorHandler.handle(context, ErrorHandlerAuth(error, context: context)));
    }
  }

  Future<ResultHandler<AuthResultStatus>> register(BuildContext context,
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
            ErrorHandler.handle(context, ErrorHandlerAuth(context: context, AuthResultStatus.unknown)));
      }
    } catch (error) {
      return ResultHandler.failure(ErrorHandler.handle(context, ErrorHandlerAuth(context:context, error)));
    }
  }
}
