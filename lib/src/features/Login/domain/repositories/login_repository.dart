import 'package:dartz/dartz.dart';
import 'package:wsc_auth/core/error/failures.dart';
import 'package:wsc_auth/src/features/login/data/models/credentials_dto.dart';
import 'package:wsc_auth/wsc_auth.dart';

abstract class LoginRepository {
  Future<Either<Failure, JWTTokenModel>> loginWithEmail(CredentialsDTO params);
}
