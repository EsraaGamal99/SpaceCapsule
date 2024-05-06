import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:space_app/core/helpers/constants.dart';
import 'package:space_app/core/helpers/functions/firebase_services.dart';
import 'package:space_app/core/helpers/functions/show_snack_bar.dart';
import 'package:space_app/features/profile/data/profile_repo.dart';
import 'package:space_app/features/profile/logic/all_profile_state.dart';

import 'edit_profile_data/edit_profile_state.dart';


class AllProfileCubit extends Cubit<AllProfileState> {
  AllProfileCubit(this._profileRepo) : super(const AllProfileState.initial());


  final ProfileRepo _profileRepo ;
  TextEditingController userNameController = TextEditingController();
  TextEditingController userEmailController = TextEditingController();
  TextEditingController userPasswordController = TextEditingController();

  User? currentUser;
  Future<void> getUserProfile(BuildContext context) async {
    try {
      emit(const AllProfileState.loading());
      final user = await getUser();
      debugPrint('AllProfileState user: $user');
      currentUser = user;
      if (currentUser != null) {
        emit(AllProfileState.success(user!));
      } else {
        await logOut();
        emit(const AllProfileState.loggedOut());
      }
    } catch (e) {
      emit(AllProfileState.error(error: e.toString()));
    }
  }
  updateProfileImage({required String photoURL}) async{
    if (photoURL.isNotEmpty)
      await _profileRepo.updatePhoto(photoURL: photoURL);
    emit(const AllProfileState.updateSuccessfully('Profile updated successfully'));
  }

  updateProfileData(BuildContext context) async {
    try {

      final token = await getToken();
      debugPrint("============================================"+token.toString());
      if(token != null && token.isNotEmpty) {
        emit(const AllProfileState.loading());
        // if (userEmailController.text.isNotEmpty){
        //   await _profileRepo.updateEmail(email: userEmailController.text, password: userPasswordController.text);
        // }
          if (userPasswordController.text.isNotEmpty){
            await _profileRepo.updatePassword(password: userPasswordController.text);
          }
          if (userNameController.text.isNotEmpty){
            await _profileRepo.updateUsername(username: userNameController.text);
          }

       // if (photoURL.isNotEmpty) _profileRepo.updatePhoto(photoURL: photoURL);
        emit(const AllProfileState.updateSuccessfully('Profile updated successfully'));
      } else {
        emit(const AllProfileState.loggedOut());
      }
    } catch(error) {
      showSnackBar(context, error.toString());
    }
  }

  void logout() {
    _profileRepo.logout();
    emit(const AllProfileState.loggedOut());
  }
}
