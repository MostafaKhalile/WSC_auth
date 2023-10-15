// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CredentialsDTO {
  final String email;
  final String password;

  CredentialsDTO(this.email, this.password);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
    };
  }

  factory CredentialsDTO.fromMap(Map<String, dynamic> map) {
    return CredentialsDTO(
      map['email'] as String,
      map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CredentialsDTO.fromJson(String source) =>
      CredentialsDTO.fromMap(json.decode(source) as Map<String, dynamic>);
}
