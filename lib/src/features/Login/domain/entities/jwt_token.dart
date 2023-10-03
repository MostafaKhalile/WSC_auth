import 'package:equatable/equatable.dart';

class JWTToken extends Equatable {
  const JWTToken({
    required this.token,
  });
  final String token;

  @override
  List<Object?> get props => [token];
}
