import 'package:freezed_annotation/freezed_annotation.dart';

part 'all_profile_state.freezed.dart';

@freezed
class AllProfileState<T> with _$AllProfileState<T> {
  const factory AllProfileState.initial() = _Initial;
  const factory AllProfileState.loading() = ProfileLoading;
  const factory AllProfileState.success(T user) = Success;
  const factory AllProfileState.updateSuccessfully(String message) = UpdateSuccessfully;
  const factory AllProfileState.error({required String error}) = Error;
  const factory AllProfileState.loggedOut() = LoggedOut;
}
