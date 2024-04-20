import 'package:freezed_annotation/freezed_annotation.dart';

part 'localization_state.freezed.dart';

@freezed
class LocalizationState<T> with _$LocalizationState<T> {
  const factory LocalizationState.initial() = _LocalaizationInitial;
  const factory LocalizationState.loading() = LocalaizationLoading;
  const factory LocalizationState.success(T data) = LocalaizationSuccess<T>;
  const factory LocalizationState.error({required String error}) = LocalaizationError;
}