import 'package:freezed_annotation/freezed_annotation.dart';

part 'one_rocket_state.freezed.dart';

@freezed
class OneRocketState<T> with _$OneRocketState<T> {
  const factory OneRocketState.initial()                          = _Initial;
  const factory OneRocketState.loading()                          = Loading;
  const factory OneRocketState.success(T data)                    = Success<T>;
  const factory OneRocketState.error({required String error})     = Error;
}