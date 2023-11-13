import 'package:dartz/dartz.dart';
import 'package:wsc_auth/src/features/Login/data/models/credentials_dto.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/usecase.dart';
import '../entities/jwt_token.dart';
import '../repositories/login_repository.dart';

class LogInUseCase extends UseCase<JWTToken, CredentialsDTO> {
  final LoginRepository repository;

  LogInUseCase(this.repository);
  @override
  Future<Either<Failure, JWTToken>> call(CredentialsDTO params) {
    return repository.loginWithEmail(params);
  }
}
