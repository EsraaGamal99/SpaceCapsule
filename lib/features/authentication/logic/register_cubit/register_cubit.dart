import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:space_app/features/authentication/data/auth_repo.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.authRepo) : super(RegistrationInitial());

  final AuthRepo authRepo;
  Future<void> userRegistration(
      {required String name,
      required String email,
      required String password}) async {
    emit(RegisterLoadingState());
    final registrationResult = await authRepo.userRegistration(
        name: name, email: email, password: password);

    registrationResult.fold((failure) {
      debugPrint(failure.errMessage);
      emit(RegisterErrorState(
        errMessage: failure.errMessage,
      ));
    }, (r) {
      emit(RegistersSuccessState());
    });
  }


}
