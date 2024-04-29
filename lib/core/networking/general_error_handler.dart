import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_service/error_model.dart';
import 'firebase_service/firebase_auth_error_handler/firebase_auth_error-handler.dart';

class Handler {
  late ErrorModel errorModel;
  Handler.handle(GeneralErrorHandler generalErrorHandler){
    errorModel = generalErrorHandler.handle();
  }
}

abstract class GeneralErrorHandler implements Exception {
  dynamic error;
  GeneralErrorHandler(this.error);
  ErrorModel handle();

}


class ErrorHandlerAuth extends GeneralErrorHandler {
  ErrorHandlerAuth(super.error);

  @override
  ErrorModel handle() {
    if (error is FirebaseException) {
      return handleErrorAuth(error);
    } else {
      // default error
      return AuthResultStatus.unknown.getFailure();
    }
  }
}
