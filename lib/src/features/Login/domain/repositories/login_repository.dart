import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../entities/jwt_token.dart';
import '../usecases/login_with_email.dart';

abstract class LoginRepository {
  Future<Either<Failure, JWTToken>> loginWithEmail(Params params);
}
