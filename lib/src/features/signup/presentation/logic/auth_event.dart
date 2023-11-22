part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class SignUpEvent extends AuthEvent {
  final SignupParamsInterface params;

  const SignUpEvent({required this.params});

  @override
  List<Object> get props => [params];
}

class SignInEvent extends AuthEvent {
  final SignupParamsInterface params;

  const SignInEvent({required this.params});

  @override
  List<Object> get props => [params];
}

class SignOutEvent extends AuthEvent {
  @override
  List<Object> get props => [];
}

class CheckAuthEvent extends AuthEvent {
  @override
  List<Object> get props => [];
}

class EmailVerificationEvent extends AuthEvent {
  final String email;

  const EmailVerificationEvent({required this.email});

  @override
  List<Object> get props => [email];
}

class EmailVerificationCheckEvent extends AuthEvent {
  final String email;

  const EmailVerificationCheckEvent({required this.email});

  @override
  List<Object> get props => [email];
}

class EmailVerificationResendEvent extends AuthEvent {
  final String email;

  const EmailVerificationResendEvent({required this.email});

  @override
  List<Object> get props => [email];
}
