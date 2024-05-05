import 'package:flutter/cupertino.dart';
import 'package:space_app/core/helpers/extenstions.dart';

class ApiConstants {
  static const String baseUrl = "https://api.spacexdata.com/v4/";

  static const String dragons  = "dragons";
  static const String landpads = "landpads";
  static const String rockets = "rockets";
}

class ApiErrors {
  // Todo: Translations
  static const String badRequestError = "badRequestError";
  static const String noContent = "noContent";
  static const String forbiddenError = "forbiddenError";
  static const String unauthorizedError = "unauthorizedError";
  static const String notFoundError = "notFoundError";
  static const String conflictError = "conflictError";
  static const String internalServerError = "internalServerError";
  static const String unknownError = "unknownError";
  static const String timeoutError = "timeoutError";
  static const String defaultError = "defaultError";
  static const String cacheError = "cacheError";
  static const String noInternetError = "noInternetError";
  static const String loadingMessage = "loading_message";
  static const String retryAgainMessage = "retry_again_message";
  static const String ok = "Ok";

  static getTranslatedError(BuildContext context, String error) {
    switch (error) {
      case badRequestError:
        return context.translate.badRequestErrorTextKey;
      case noContent:
        return context.translate.noContentErrorTextKey;
      case forbiddenError:
        return context.translate.forbiddenErrorTextKey;
      case unauthorizedError:
        return context.translate.unauthorizedErrorTextKey;
      case notFoundError:
        return context.translate.notFoundErrorTextKey;
      case conflictError:
        return context.translate.conflictErrorTextKey;
      case internalServerError:
        return context.translate.internalServerErrorTextKey;
      case unknownError:
        return context.translate.unknownErrorTextKey;
      case timeoutError:
        return context.translate.timeoutErrorTextKey;
      case defaultError:
        return context.translate.defaultErrorMessageTextKey;
      case cacheError:
        return context.translate.cacheErrorTextKey;
      case noInternetError:
        return context.translate.noInternetErrorTextKey;
      case loadingMessage:
        return context.translate.loadingMessageTextKey;
      case retryAgainMessage:
        return context.translate.retryAgainMessageTextKey;
      case ok:
        return context.translate.okTextKey;
      default:
        return context.translate.defaultErrorMessageTextKey;
    }
  }
}
