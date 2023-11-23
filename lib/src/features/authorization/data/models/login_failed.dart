import 'package:equatable/equatable.dart';
import 'package:wsc_auth/utilities/failure.dart';

// ignore: must_be_immutable
class LoginFailed extends Equatable implements CustomException {
  LoginFailed({
    this.message,
    this.code,
  });

  @override
  String toString() => 'LoginFailed{message: $message, code: $code}';

  @override
  int? code;

  @override
  String? message;

  @override
  List<Object?> get props => [code, message];
}
