part of 'register_cubit.dart';

@immutable
sealed class RegisterState {}

final class RegistrationInitial extends RegisterState {}

final class RegisterLoadingState extends RegisterState {}

final class RegistersSuccessState  extends RegisterState {}

final class RegisterErrorState extends RegisterState {
  final String errMessage;
  RegisterErrorState({required this.errMessage});
}


