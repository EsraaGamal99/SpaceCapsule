

import 'package:freezed_annotation/freezed_annotation.dart';

import 'error_handler_base.dart';
part 'result_handler.freezed.dart';

@Freezed()
abstract class ResultHandler<T> with _$ResultHandler<T> {
  const factory ResultHandler.success(T data) = Success<T>;
  const factory ResultHandler.failure(Handler errorHandler) = Failure<T>;
}
