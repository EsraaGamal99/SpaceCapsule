import 'package:freezed_annotation/freezed_annotation.dart';

part 'rockets_state.freezed.dart';

@freezed
class RocketsState<T> with _$RocketsState<T> {
  const factory RocketsState.initial()                          = _Initial;
  const factory RocketsState.loading()                          = Loading;
  const factory RocketsState.success(T data)                    = Success<T>;
  const factory RocketsState.error({required String error})     = Error;
}