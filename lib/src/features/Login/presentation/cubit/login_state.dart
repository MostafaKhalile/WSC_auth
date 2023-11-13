part of 'login_cubit.dart';

sealed class LoginState extends Equatable {}

final class LoginInitial extends LoginState {
  @override
  List<Object?> get props => [];
}

final class LoginLoading extends LoginState {
  @override
  List<Object?> get props => [];
}

final class LoginSuccess extends LoginState {
  final String token;

  LoginSuccess({required this.token});

  @override
  List<Object?> get props => [token];
}

final class LoginFailed extends LoginState {
  final String error;

  LoginFailed(this.error);

  @override
  List<Object?> get props => [error];
}
