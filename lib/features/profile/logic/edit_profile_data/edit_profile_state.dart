import 'package:freezed_annotation/freezed_annotation.dart';
part 'edit_profile_state.freezed.dart';

@freezed
class EditProfileState<T> with _$EditProfileState<T> {
  const factory EditProfileState.initial() = _Initial;
  const factory EditProfileState.loading() = Loading;
  const factory EditProfileState.updateSuccess(T data) = UpdateSuccess<T>;
  const factory EditProfileState.error({required String error}) = Error;
}
