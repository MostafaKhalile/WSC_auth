import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/usecase.dart';
import '../entities/jwt_token.dart';
import '../repositories/login_repository.dart';

class LogInUseCase extends UseCase<JWTToken, Params> {
  final LoginRepository repository;

  LogInUseCase(this.repository);
  @override
  Future<Either<Failure, JWTToken>> call(Params params) {
    return repository.loginWithEmail(params);
  }
}

class Params extends Equatable {
  Params({
    required this.email,
    required this.password,
  });
  late final String email;
  late final String password;

  Params.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['email'] = email;
    _data['password'] = password;
    return _data;
  }

  @override
  List<Object?> get props => [email, password];
}
