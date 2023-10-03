import 'package:dartz/dartz.dart';
import 'package:wsc_auth/src/features/signup/data/data_sources/signup_datasource.dart';
import 'package:wsc_auth/src/features/signup/data/models/signup_failed.dart';
import 'package:wsc_auth/src/features/signup/data/models/user_model.dart';
import 'package:wsc_auth/src/features/signup/domain/repositories/auth_repository.dart';
import 'package:wsc_auth/src/features/signup/signup_params.dart';

class AuthRepositoryImpl extends AuthRepository {
  final SignUpDataSource dataSource;

  AuthRepositoryImpl(this.dataSource);

  @override
  Future<Either<SignupFailed, UserModel>> signUp(
      SignupParamsInterface params) async {
    try {
      var results = await dataSource.signUp(params);
      return Right(results);
    }

    catch (e) {
      return Left(SignupFailed());
    }
  }
}
