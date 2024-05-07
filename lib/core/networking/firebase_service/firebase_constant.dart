

import 'package:flutter/cupertino.dart';
import 'package:space_app/core/helpers/extenstions.dart';

class FirebaseErrors {

  static const String emailAlreadyExists             = "The email address is already in use by another account.";
  static const String invalidCredential              = "Email or Password is incorrect";
  static const String wrongPassword                  = "The password you entered is incorrect.";
  static const String weakPassword                  = "The password you provided is too weak.";
  static const String invalidEmail                   = "Please enter a valid email.";
  static const String userNotFound                   = "No account found with the provided email address. Please check your email or sign up for a new account.";
  static const String userDisabled                   = "User with this email has been disabled.";
  static const String operationNotAllowed            = "The requested operation is not allowed. Please contact support for assistance.";
  static const String tooManyRequests                = "The email has already been registered. Please login or reset your password.";
  static const String undefined                      = "An undefined Error happened.";

  static getTranslatedError(BuildContext context, String error) {
    switch (error) {
      case emailAlreadyExists:
        return context.translate.emailAlreadyExistsTextKey;
      case invalidCredential:
        return context.translate.invalidCredentialsTextKey;
      case wrongPassword:
        return context.translate.wrongPasswordTextKey;
      case weakPassword:
        return context.translate.weakPasswordTextKey;
      case invalidEmail:
        return context.translate.invalidEmailTextKey;
      case userNotFound:
        return context.translate.userNotFoundTextKey;
      case userDisabled:
        return context.translate.userDisabledTextKey;
      case operationNotAllowed:
        return context.translate.operationNotAllowedTextKey;
      case tooManyRequests:
        return context.translate.tooManyRequestsTextKey;
      case undefined:
        return context.translate.undefinedErrorTextKey;
      default:
        return context.translate.defaultErrorTextKey;
    }
  }
}
