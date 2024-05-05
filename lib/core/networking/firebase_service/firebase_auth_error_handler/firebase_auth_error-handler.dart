import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '../../error_model.dart';
import '../firebase_constant.dart';

enum AuthResultStatus {
  successful,
  invalidCredential,
  wrongPassword,
  weakPassword,
  emailAlreadyExists,
  invalidEmail,
  userNotFound,
  userDisabled,
  operationNotAllowed,
  tooManyRequests,
  unknown,
}

class ResponseMessage {
  static const String INVALID_EMAIL = FirebaseErrors.invalidEmail;
  static const String EMAIL_ALREADY_EXISTS = FirebaseErrors.emailAlreadyExists;
  static const String WRONG_PASSWORD = FirebaseErrors.wrongPassword;
  static const String WEAK_PASSWORD = FirebaseErrors.weakPassword;
  static const String INVALID_CREDENTIA = FirebaseErrors.invalidCredential;
  static const String USER_NOT_FOUND = FirebaseErrors.userNotFound;
  static const String USER_DISABLED = FirebaseErrors.userDisabled;
  static const String TOO_MANY_REGUSTES = FirebaseErrors.tooManyRequests;
  static const String OPERATION_NOT_ALLOWED =
      FirebaseErrors.operationNotAllowed;
  static const String UNDIFIEND = FirebaseErrors.undefined;
}

extension AuthExceptionHandler on AuthResultStatus {
  ErrorModel getFailure() {
    switch (this) {
      case AuthResultStatus.invalidEmail:
        return ErrorModel(code: 0, message: ResponseMessage.INVALID_EMAIL);

      case AuthResultStatus.wrongPassword:
        return ErrorModel(code: 0, message: ResponseMessage.WRONG_PASSWORD);

      case AuthResultStatus.weakPassword:
        return ErrorModel(code: 0, message: ResponseMessage.WEAK_PASSWORD);

      case AuthResultStatus.invalidCredential:
        return ErrorModel(code: 0, message: ResponseMessage.INVALID_CREDENTIA);

      case AuthResultStatus.emailAlreadyExists:
        return ErrorModel(
            code: 0, message: ResponseMessage.EMAIL_ALREADY_EXISTS);

      case AuthResultStatus.userNotFound:
        return ErrorModel(code: 0, message: ResponseMessage.USER_NOT_FOUND);

      case AuthResultStatus.userDisabled:
        return ErrorModel(code: 0, message: ResponseMessage.USER_DISABLED);

      case AuthResultStatus.operationNotAllowed:
        return ErrorModel(
            code: 0, message: ResponseMessage.OPERATION_NOT_ALLOWED);

      case AuthResultStatus.tooManyRequests:
        return ErrorModel(code: 0, message: ResponseMessage.TOO_MANY_REGUSTES);

      default:
        return ErrorModel(code: 0, message: ResponseMessage.UNDIFIEND);
    }
  }
}

class FirebaseAuthErrorHandler implements Exception {
  late ErrorModel firebaseErrorModel;

  FirebaseAuthErrorHandler.handle(dynamic error) {
    if (error is FirebaseException) {
      firebaseErrorModel = handleErrorAuth(error);
    } else {
      // default error
      firebaseErrorModel = AuthResultStatus.unknown.getFailure();
    }
  }
}

ErrorModel handleErrorAuth(FirebaseException error) {
  debugPrint('${error.code}=============================');
  switch (error.code) {
    case "invalid-email":
      return AuthResultStatus.invalidEmail.getFailure();
    case "invalid-credential":
      return AuthResultStatus.invalidCredential.getFailure();
    case "wrong-password":
      return AuthResultStatus.wrongPassword.getFailure();
    case "weak-password":
      return AuthResultStatus.weakPassword.getFailure();
    case "email-already-in-use":
      return AuthResultStatus.emailAlreadyExists.getFailure();
    case "user-disabled":
      return AuthResultStatus.userDisabled.getFailure();
    case "user-not-found":
      return AuthResultStatus.userNotFound.getFailure();
    case "operation-not-allowed":
      return AuthResultStatus.operationNotAllowed.getFailure();
    case "too-many-requests":
      return AuthResultStatus.tooManyRequests.getFailure();

    default:
      return AuthResultStatus.unknown.getFailure();
  }
}
