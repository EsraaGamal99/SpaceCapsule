import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_app/core/helpers/functions/show_snack_bar.dart';
import 'package:space_app/features/profile/data/profile_repo.dart';

import 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit(this._profileRepo) : super(const EditProfileState.initial());

  final ProfileRepo _profileRepo ;
  TextEditingController userNameController = TextEditingController();
  TextEditingController userEmailController = TextEditingController();
  TextEditingController userPasswordController = TextEditingController();

  updateProfileImage({required String photoURL}){
    if (photoURL.isNotEmpty) _profileRepo.updatePhoto(photoURL: photoURL);
    emit(const EditProfileState.updateSuccess('Profile updated successfully'));
  }
  void updateProfileData(BuildContext context, {required String photoURL}) async {
    try {
      emit(const EditProfileState.loading());
      if (userEmailController.text.isNotEmpty) _profileRepo.updateEmail(email: userEmailController.text, password: userPasswordController.text);
      // if (userPasswordController.text.isNotEmpty) _profileRepo.updatePassword(password: userPasswordController.text);
      // if (userNameController.text.isNotEmpty) _profileRepo.updateUsername(username: userNameController.text);
      //if (photoURL.isNotEmpty) _profileRepo.updatePhoto(photoURL: photoURL);
      emit(const EditProfileState.updateSuccess('Profile updated successfully'));
    } catch(error) {
      showSnackBar(context, error.toString());
    }
  }
}
