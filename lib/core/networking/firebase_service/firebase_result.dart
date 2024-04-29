
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:space_app/core/networking/general_error_handler.dart';
import 'firebase_auth_error_handler/firebase_auth_error-handler.dart';
part 'firebase_result.freezed.dart';

@Freezed()
abstract class FirebaseResult<T> with _$FirebaseResult<T> {
  const factory FirebaseResult.success(AuthResultStatus status) = Success<T>;
  const factory FirebaseResult.failure(Handler errorHandler) = Failure<T>;
}