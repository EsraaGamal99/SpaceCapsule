part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoadingState extends LoginState {}

final class LoginSuccessState  extends LoginState {}

final class LoginErrorState extends LoginState {
  final String errMessage;
  LoginErrorState({required this.errMessage});
}