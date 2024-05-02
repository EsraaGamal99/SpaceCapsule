import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_state.freezed.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = _Initial;
  const factory ProfileState.loading() = Loading;
  const factory ProfileState.success(User user) = Success;
  const factory ProfileState.updateSuccess(String data) = UpdateSuccess;
  const factory ProfileState.error({required String error}) = Error;
  const factory ProfileState.loggedOut() = LoggedOut;
}
