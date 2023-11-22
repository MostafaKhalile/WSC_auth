import 'package:dartz/dartz.dart';
import 'package:wsc_auth/core/error/failures.dart';
import 'package:wsc_auth/src/features/authorization/data/datasources/oauth_api_data_source.dart';
import 'package:wsc_auth/src/features/authorization/data/models/access_token_model.dart';
import 'package:wsc_auth/src/features/authorization/data/models/oauth_dto.dart';
import 'package:wsc_auth/src/features/authorization/domain/repositories/oauth_repository.dart';

class OAuthRepositoryImp extends OAuthRepository {
  final OAuthAPIDataSource dataSource;

  OAuthRepositoryImp(this.dataSource);
  @override
  Future<Either<Failure, AccessTokenModel>> authorize(OAuthDTO params) async {
    try {
      var results = await dataSource.authorize(params);
      return Right(results!);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
