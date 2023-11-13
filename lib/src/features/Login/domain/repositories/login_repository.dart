import 'package:dartz/dartz.dart';
import 'package:wsc_auth/core/error/failures.dart';

import '../../data/models/credentials_dto.dart';
import '../entities/jwt_token.dart';

abstract class LoginRepository {
  Future<Either<Failure, JWTToken>> loginWithEmail(CredentialsDTO params);
}
