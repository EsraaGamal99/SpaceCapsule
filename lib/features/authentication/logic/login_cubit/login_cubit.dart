import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:space_app/features/authentication/data/auth_repo.dart';
import '../../../../core/networking/internet_checker.dart';
import '../../data/models/login_model.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LogInState> {
  final AuthRepo authRepo;
  final InternetCheckerImpl internetChecker;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginCubit(this.authRepo, this.internetChecker) : super(const LogInState.initial());

  Future<void> userLogin(BuildContext context,
      {required String email, required String password}) async {
    if (await internetChecker.isConnected) {
      emit(const LogInState.loading());

      final loginCredentials = LoginModel(email: email, password: password);

      final response = await authRepo.logIn(loginCredentials);

      response.when(success: (loginModel) {
        emit(LogInState.success(loginModel));
        debugPrint(loginModel.toString());
      },
          failure: (error) {
            emit(LogInState.error(error: error.errorModel.message ?? ''));
          });
    }else{
      print("==============================object");
      emit(LogInState.internetConnectionFaild());
    }

  }
}
