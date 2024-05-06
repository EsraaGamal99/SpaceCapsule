import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:space_app/core/helpers/constants.dart';
import 'package:space_app/features/authentication/data/auth_repo.dart';
import 'package:space_app/features/authentication/data/models/register_model.dart';
import 'package:space_app/features/authentication/logic/register_cubit/register_state.dart';

import '../../../../core/networking/internet_checker.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final AuthRepo authRepo;
  final InternetCheckerImpl internetChecker;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  RegisterCubit(this.authRepo, this.internetChecker) : super(const RegisterState.initial()){
    checkAuthStatus();
  }

  Future<void> checkAuthStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final isLoggedIn = prefs.getBool(isSignedUp) ?? false;
    // if (isLoggedIn) {
    //   emit(const RegisterState.loggedUp());
    // }
  }

  Future<void> userRegistration(BuildContext context,{required String name,
    required String email,
    required String password}) async {
    if (await internetChecker.isConnected) {
      emit(const RegisterState.loading());
      final registerCredentials =
      RegisterModel(name: name, email: email, password: password);


    final response = await authRepo.register(context, registerCredentials);

      response.when(success: (registerModel) {
        emit(RegisterState.success(registerModel));
      }, failure: (error) {
        emit(RegisterState.error(error: error.errorModel.message ?? ''));
      });
    }else {
      emit(RegisterState.internetConnectionFaild());
    }
  }
}