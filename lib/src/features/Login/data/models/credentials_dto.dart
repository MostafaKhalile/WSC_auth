import 'package:equatable/equatable.dart';

class CredentialsDTO extends Equatable {
  final String email;
  final String password;

  const CredentialsDTO({required this.email, required this.password});

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'email': email,
      'password': password,
    };
  }

  @override
  List<Object?> get props => [email, password];
}
