import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:space_app/features/authentication/data/auth_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitial());
  final AuthRepo authRepo;

  Future<void> userLogin(
      {required String email, required String password}) async {
    emit(LoginLoadingState());
    final loginResult =
    await authRepo.userLogin(email: email, password: password);

    loginResult.fold((failure) {
      debugPrint(failure.errMessage);
      emit(LoginErrorState(
        errMessage: failure.errMessage,
      ));
    }, (r) {
      emit(LoginSuccessState());
    });
  }
}
