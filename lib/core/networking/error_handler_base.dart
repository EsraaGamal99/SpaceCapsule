import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_service/firebase_auth_error_handler/firebase_auth_error-handler.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'api_service/api_error_handler.dart';
import 'error_model.dart';

class ErrorHandler {
  late ErrorModel errorModel;
  ErrorHandler.handle(BuildContext context, ErrorHandlerBaise errorHandlerBaise){
    errorModel = errorHandlerBaise.handle(context);
  }
}

abstract class ErrorHandlerBaise implements Exception {
  //ErrorModel? errorModel;
  dynamic error;
  ErrorHandlerBaise(this.error);
  ErrorModel handle(BuildContext context);

}

class ApiErrorHandler extends ErrorHandlerBaise {
  ApiErrorHandler(super.error);

  @override
  ErrorModel handle(BuildContext context) {
    if (error is DioException) {
      // dio error so its an error from response of the API or from dio itself
      return handleError(context, this.error);
    } else {
      // default error
      return DataSource.DEFAULT.getFailure(context);
    }
  }


}


class ErrorHandlerAuth extends ErrorHandlerBaise {
  final BuildContext context;
  ErrorHandlerAuth(super.error, {required this.context});

  @override
  ErrorModel handle(BuildContext context) {
    if (error is FirebaseException) {
      return handleErrorAuth(context, error);
    } else {
      // default error
      return AuthResultStatus.unknown.getFailure(context);
    }
  }
}


class SharedPreferencesErrorHandler extends ErrorHandlerBaise {
  SharedPreferencesErrorHandler(super.error);

  @override
  ErrorModel handle(BuildContext context) {
    if (error == null) {
      // Local data is empty
      return ErrorModel(message: "There is not Data in Shared Memory");
    } else {
      // default error
      debugPrint("confirm Shared Preferences Implmentation");
      return ErrorModel(message: "confirm Shared Preferences Implmentation");
    }
  }
}