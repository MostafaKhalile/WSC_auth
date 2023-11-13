import 'package:dartz/dartz.dart';
import 'package:wsc_auth/src/features/Login/data/datasources/login_api_data_source.dart';

import '../../../../../core/error/failures.dart';
import '../../domain/entities/jwt_token.dart';
import '../../domain/repositories/login_repository.dart';
import '../models/credentials_dto.dart';

class LoginRepositoryImp implements LoginRepository {
  final LogInAPIDataSource dataSource;

  LoginRepositoryImp(this.dataSource);
  @override
  Future<Either<Failure, JWTToken>> loginWithEmail(
      CredentialsDTO params) async {
    try {
      var results = await dataSource.login(params);
      return Right(results!);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
