import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_app/core/helpers/functions/navigate_after_splash.dart';
import 'package:space_app/features/profile/data/profile_repo.dart';
import 'package:space_app/features/profile/logic/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo _profileRepo = ProfileRepo();
  ProfileCubit() : super(const ProfileState.initial()) {
    checkToken();
  }

  User? currentUser;
  Future<void> getUserProfile(BuildContext context) async {
    try {
      emit(const ProfileState.loading());
      final user = await _profileRepo.getUser();
      debugPrint('ProfileState user: $user');
      currentUser = user;
      if (await checkToken()) {
        emit(ProfileState.success(user!));
      } else {
        emit(const ProfileState.loggedOut());
      }
    } catch (e) {
      emit(ProfileState.error(error: e.toString()));
    }
  }

  void logout() {
    _profileRepo.logout();
    emit(const ProfileState.loggedOut());
  }

  updateUserProfile(
      {required String email,
      required String password,
      required String username,
      required String photoURL}) async {
    if (email.isNotEmpty) updateEmail(email: email);
    if (password.isNotEmpty) updatePassword(password: password);
    if (username.isNotEmpty) updateUsername(username: username);
    if (photoURL.isNotEmpty) updatePhoto(photoURL: photoURL);
  }

  void updateEmail({required String email}) {
    _profileRepo.updateEmail(email: email);
    emit(ProfileState.updateSuccess(email));
  }

  void updatePassword({required String password}) {
    _profileRepo.updatePassword(password: password);
    emit(ProfileState.updateSuccess(password));
  }

  void updateUsername({required String username}) {
    _profileRepo.updateUsername(username: username);
    emit(ProfileState.updateSuccess(username));
  }

  void updatePhoto({required String photoURL}) {
    _profileRepo.updatePhoto(photoURL: photoURL);
    emit(ProfileState.updateSuccess(photoURL));
  }
}


