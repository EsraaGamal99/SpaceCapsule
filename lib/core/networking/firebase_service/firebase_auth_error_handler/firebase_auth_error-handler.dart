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
  ErrorModel getFailure(BuildContext context) {
    switch (this) {
      case AuthResultStatus.invalidEmail:
        return ErrorModel(code: 0, message: FirebaseErrors.getTranslatedError(context, ResponseMessage.INVALID_EMAIL));

      case AuthResultStatus.wrongPassword:
        return ErrorModel(code: 0, message: FirebaseErrors.getTranslatedError(context, ResponseMessage.WRONG_PASSWORD));

      case AuthResultStatus.weakPassword:
        return ErrorModel(code: 0, message: FirebaseErrors.getTranslatedError(context, ResponseMessage.WEAK_PASSWORD));

      case AuthResultStatus.invalidCredential:
        return ErrorModel(code: 0, message: FirebaseErrors.getTranslatedError(context, ResponseMessage.INVALID_CREDENTIA));

      case AuthResultStatus.emailAlreadyExists:
        return ErrorModel(
            code: 0, message: FirebaseErrors.getTranslatedError(context, ResponseMessage.EMAIL_ALREADY_EXISTS));

      case AuthResultStatus.userNotFound:
        return ErrorModel(code: 0, message: FirebaseErrors.getTranslatedError(context, ResponseMessage.USER_NOT_FOUND));

      case AuthResultStatus.userDisabled:
        return ErrorModel(code: 0, message: FirebaseErrors.getTranslatedError(context, ResponseMessage.USER_DISABLED));

      case AuthResultStatus.operationNotAllowed:
        return ErrorModel(
            code: 0, message: FirebaseErrors.getTranslatedError(context, ResponseMessage.OPERATION_NOT_ALLOWED));

      case AuthResultStatus.tooManyRequests:
        return ErrorModel(code: 0, message: FirebaseErrors.getTranslatedError(context, ResponseMessage.TOO_MANY_REGUSTES));

      default:
        return ErrorModel(code: 0, message: FirebaseErrors.getTranslatedError(context, ResponseMessage.UNDIFIEND));
    }
  }
}

class FirebaseAuthErrorHandler implements Exception {
  late ErrorModel firebaseErrorModel;

  FirebaseAuthErrorHandler.handle(BuildContext context, dynamic error) {
    if (error is FirebaseException) {
      firebaseErrorModel = handleErrorAuth(context, error);
    } else {
      // default error
      firebaseErrorModel = AuthResultStatus.unknown.getFailure(context);
    }
  }
}

ErrorModel handleErrorAuth(BuildContext context, FirebaseException error) {
  debugPrint('${error.code}=============================');
  switch (error.code) {
    case "invalid-email":
      return AuthResultStatus.invalidEmail.getFailure(context);
    case "invalid-credential":
      return AuthResultStatus.invalidCredential.getFailure(context);
    case "wrong-password":
      return AuthResultStatus.wrongPassword.getFailure(context);
    case "weak-password":
      return AuthResultStatus.weakPassword.getFailure(context);
    case "email-already-in-use":
      return AuthResultStatus.emailAlreadyExists.getFailure(context);
    case "user-disabled":
      return AuthResultStatus.userDisabled.getFailure(context);
    case "user-not-found":
      return AuthResultStatus.userNotFound.getFailure(context);
    case "operation-not-allowed":
      return AuthResultStatus.operationNotAllowed.getFailure(context);
    case "too-many-requests":
      return AuthResultStatus.tooManyRequests.getFailure(context);

    default:
      return AuthResultStatus.unknown.getFailure(context);
  }
}
