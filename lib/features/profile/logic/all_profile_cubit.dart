import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:space_app/core/helpers/functions/firebase_services.dart';
import 'package:space_app/core/helpers/functions/show_snack_bar.dart';
import 'package:space_app/features/profile/data/profile_repo.dart';
import 'package:space_app/features/profile/logic/all_profile_state.dart';


class AllProfileCubit extends Cubit<AllProfileState> {
  AllProfileCubit() : super(const AllProfileState.initial());

  final ProfileRepo _profileRepo = ProfileRepo();
  TextEditingController userNameController = TextEditingController();
  TextEditingController userEmailController = TextEditingController();
  TextEditingController userPasswordController = TextEditingController();

  User? currentUser;
  Future<void> getUserProfile(BuildContext context) async {
    try {
      emit(const AllProfileState.loading());
      debugPrint('ProfileState user');
      final user = await getUser();
      debugPrint('ProfileState user: $user');
      currentUser = user;
      debugPrint('ProfileState currentUser: $currentUser');
      if (currentUser != null) {
        emit(AllProfileState.success(user));
      } else {
        emit(const AllProfileState.loggedOut());
      }
    } catch (e) {
      emit(AllProfileState.error(error: e.toString()));
    }
  }

  void updateProfileData(BuildContext context, {required String photoURL}) async {
    try {
      final token = await getToken();
      if(token != null && token.isNotEmpty) {
        emit(const AllProfileState.loading());
        if (userEmailController.text.isNotEmpty) _profileRepo.updateEmail(email: userEmailController.text, password: userPasswordController.text);
        if (userPasswordController.text.isNotEmpty) _profileRepo.updatePassword(password: userPasswordController.text);
        if (userNameController.text.isNotEmpty) _profileRepo.updateUsername(username: userNameController.text);
        if (photoURL.isNotEmpty) _profileRepo.updatePhoto(photoURL: photoURL);
        emit(const AllProfileState.updateSuccessfully('Profile updated successfully'));
      } else {
        emit(const AllProfileState.loggedOut());
      }
    } catch(error) {
      showSnackBar(context, error.toString());
    }
  }

  void logout({required BuildContext context,}) {
    _profileRepo.logout(context: context);
    emit(const AllProfileState.loggedOut());
  }
}
