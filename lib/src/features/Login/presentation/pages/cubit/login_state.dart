part of 'login_cubit.dart';

sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {
  final String token;

  LoginSuccess(this.token);
}

final class LoginFailed extends LoginState {
  final String error;

  LoginFailed(this.error);
}
