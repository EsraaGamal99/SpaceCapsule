import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:space_app/core/helpers/constants.dart';
import 'package:space_app/core/helpers/functions/firebase_services.dart';
import 'package:space_app/core/routing/routes.dart';
import 'package:space_app/features/profile/logic/all_profile_cubit.dart';
import 'package:space_app/features/profile/logic/edit_profile_data/edit_profile_cubit.dart';
import 'package:space_app/features/profile/logic/profile_cubit.dart';

void navigateAfterSplash(BuildContext context) async {
  final prefs = await SharedPreferences.getInstance();
  bool? isLoggedIn = prefs.getBool(isSignedIn);
  bool? isLoggedUp = prefs.getBool(isSignedUp);
  String? currentToken = prefs.getString(token);
  if(isLoggedIn == true && currentToken != null) {
    Navigator.pushReplacementNamed(context, Routes.homeScreen);
  } else if (isLoggedUp == true) {
    Navigator.pushReplacementNamed(context, Routes.loginScreen);
  } else {
    Navigator.pushReplacementNamed(context, Routes.firstOnboardingScreen);
  }
}


Future pickImage(ImageSource imageSource, BuildContext context) async {
  final pickedFile = await ImagePicker().pickImage(source: imageSource);
  if (pickedFile != null) {
    await context.read<AllProfileCubit>().updateProfileImage(photoURL: pickedFile.path);
    // BlocProvider.of<EditProfileCubit>(context).updateProfileData(context, photoURL: pickedFile.path);
    await context.read<AllProfileCubit>().getUserProfile(context);
  }
}