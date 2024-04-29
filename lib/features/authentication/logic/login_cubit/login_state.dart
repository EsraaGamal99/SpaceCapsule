import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_state.freezed.dart';

@freezed
class LogInState<T> with _$LogInState<T>{
  const factory LogInState.initial() = _Initial;

  const factory LogInState.loading() = Loading;
  const factory LogInState.success(T data) = Success<T>;
  const factory LogInState.error({required String error}) = Error;
}
