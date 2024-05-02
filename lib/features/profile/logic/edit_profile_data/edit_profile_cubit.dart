import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_app/features/profile/data/profile_repo.dart';

import 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit() : super(const EditProfileState.initial());

  final ProfileRepo _profileRepo = ProfileRepo();
  TextEditingController userNameController = TextEditingController();
  TextEditingController userEmailController = TextEditingController();
  TextEditingController userPasswordController = TextEditingController();

  void updateProfileData({required String photoURL}) async {
    emit(const EditProfileState.loading());
    if (userEmailController.text.isNotEmpty) _profileRepo.updateEmail(email: userEmailController.text);
    if (userPasswordController.text.isNotEmpty) _profileRepo.updatePassword(password: userPasswordController.text);
    if (userNameController.text.isNotEmpty) _profileRepo.updateUsername(username: userNameController.text);
    if (photoURL.isNotEmpty) _profileRepo.updatePhoto(photoURL: photoURL);
    emit(const EditProfileState.updateSuccess('Data updated successfully'));
  }
}