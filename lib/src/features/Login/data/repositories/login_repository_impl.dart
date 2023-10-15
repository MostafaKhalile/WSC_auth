import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../../domain/entities/jwt_token.dart';
import '../../domain/repositories/login_repository.dart';
import '../../domain/usecases/login_with_email.dart';

class LoginRepositoryImp implements LoginRepository {
  // final apiDatasource = LogInAPIDataSourceImpl();
  @override
  Future<Either<Failure, JWTToken>> loginWithEmail(Params params) {
    // TODO: implement loginWithEmail
    throw UnimplementedError();
  }
}
