import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:space_app/core/helpers/constants.dart';
import 'package:space_app/features/authentication/data/auth_repo.dart';
import '../../../../core/networking/internet_checker.dart';
import '../../data/models/login_model.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LogInState> {
  final AuthRepo authRepo;
  final InternetCheckerImpl internetChecker;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginCubit(this.authRepo, this.internetChecker) : super(const LogInState.initial()){
    // checkAuthStatus();
  }

  Future<void> checkAuthStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final isLoggedIn = prefs.getBool(isSignedIn) ?? false;

    // if (isLoggedIn) {
    //   emit(const LogInState.loggedIn());
    // }
  }

  Future<void> userLogin(BuildContext context,
      {required String email, required String password}) async {
    if (await internetChecker.isConnected) {
      emit(const LogInState.loading());

      final loginCredentials = LoginModel(email: email, password: password);

      final response = await authRepo.logIn(context, loginCredentials);

      response.when(success: (loginModel) {
        emit(LogInState.success(loginModel));
        debugPrint(loginModel.toString());
      },
          failure: (error) {
            emit(LogInState.error(error: error.errorModel.message ?? ''));
          });
    }else{
      emit(LogInState.internetConnectionFaild());
    }

  }
}
