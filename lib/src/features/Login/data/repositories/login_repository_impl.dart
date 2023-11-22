import 'package:dartz/dartz.dart';
import 'package:wsc_auth/core/error/failures.dart';
import 'package:wsc_auth/wsc_auth.dart';

class LoginRepositoryImp extends LoginRepository {
  final LogInAPIDataSource dataSource;

  LoginRepositoryImp(this.dataSource);
  @override
  Future<Either<Failure, JWTTokenModel>> loginWithEmail(
      CredentialsDTO params) async {
    try {
      var results = await dataSource.login(params);
      return Right(results!);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
