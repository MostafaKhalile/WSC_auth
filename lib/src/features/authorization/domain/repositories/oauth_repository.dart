import 'package:dartz/dartz.dart';
import 'package:wsc_auth/core/error/failures.dart';
import 'package:wsc_auth/src/features/authorization/data/models/access_token_model.dart';
import 'package:wsc_auth/src/features/authorization/data/models/oauth_dto.dart';

abstract class OAuthRepository {
  Future<Either<Failure, AccessTokenModel>> authorize(OAuthDTO params);
}
