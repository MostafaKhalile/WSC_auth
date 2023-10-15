import 'package:equatable/equatable.dart';
import 'package:wsc_auth/utilities/failure.dart';

class SignupFailed  extends Equatable implements CustomException{
   SignupFailed({
   this.message,
    this.code,
  }):super();

  @override
  String toString() => 'SignupFailed{message: $message, code: $code}';

  @override
  int? code;

  @override
  String? message;

  @override
  List<Object?> get props => [code, message];
}

