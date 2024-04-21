
import 'package:dio/dio.dart';
import 'api_service/api_error_handler.dart';
import 'error_model.dart';

class ErrorHandler {
  late ErrorModel errorModel;
  ErrorHandler.handle(ErrorHandlerBaise errorHandlerBaise){
    errorModel = errorHandlerBaise.handle();
  }
}

abstract class ErrorHandlerBaise implements Exception {
  //ErrorModel? errorModel;
  dynamic error;
  ErrorHandlerBaise(this.error);
  ErrorModel handle();

}

class ApiErrorHandler extends ErrorHandlerBaise {
  ApiErrorHandler(super.error);

  @override
  ErrorModel handle() {
    if (error is DioException) {
      // dio error so its an error from response of the API or from dio itself
      return handleError(this.error);
    } else {
      // default error
      return DataSource.DEFAULT.getFailure();
    }
  }


}