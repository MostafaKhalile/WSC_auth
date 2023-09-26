part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];
}


class Authenticated extends AuthState {
  final User user;

  const Authenticated({required this.user});

  @override
  List<Object> get props => [user];
}

class UnAuthenticated extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthLoading extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthError extends AuthState {
  final String message;

  const AuthError({required this.message});

  @override
  List<Object> get props => [message];
}

class AuthEmailVerification extends AuthState {
  final String message;

  const AuthEmailVerification({required this.message});

  @override
  List<Object> get props => [message];
}

class AuthEmailVerificationError extends AuthState {
  final String message;

  const AuthEmailVerificationError({required this.message});

  @override
  List<Object> get props => [message];
}

class AuthEmailVerificationLoading extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthEmailVerificationInitial extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthEmailVerificationSuccess extends AuthState {
  final String message;

  const AuthEmailVerificationSuccess({required this.message});

  @override
  List<Object> get props => [message];
}

class AuthEmailVerificationFailed extends AuthState {
  final String message;

  const AuthEmailVerificationFailed({required this.message});

  @override
  List<Object> get props => [message];
}

class AuthEmailVerificationCodeResend extends AuthState {
  final String message;

  const AuthEmailVerificationCodeResend({required this.message});

  @override
  List<Object> get props => [message];
}

class AuthEmailVerificationCodeResendError extends AuthState {
  final String message;

  const AuthEmailVerificationCodeResendError({required this.message});

  @override
  List<Object> get props => [message];
}

class AuthEmailVerificationCodeResendLoading extends AuthState {
  @override
  List<Object> get props => [];
}

