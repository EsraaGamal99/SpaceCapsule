import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_app/core/helpers/functions/firebase_services.dart';
import 'package:space_app/core/helpers/functions/navigate_after_splash.dart';
import 'package:space_app/features/profile/data/profile_repo.dart';
import 'package:space_app/features/profile/logic/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo _profileRepo = ProfileRepo();
  ProfileCubit() : super(const ProfileState.initial());

  User? currentUser;
  Future<void> getUserProfile(BuildContext context) async {
    try {
      emit(const ProfileState.loading());
      final user = await getUser();
      debugPrint('ProfileState user: $user');
      currentUser = user;
      if (currentUser != null) {
        emit(ProfileState.success(user!));
      } else {
        await logOut();
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
}


