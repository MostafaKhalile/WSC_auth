import 'package:dartz/dartz.dart';
import 'package:wsc_auth/src/features/authorization/data/models/oauth_dto.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/usecase.dart';
import '../entities/access_token.dart';
import '../repositories/oauth_repository.dart';

class AuthorizeUseCase extends UseCase<AccessToken, OAuthDTO> {
  final OAuthRepository repository;

  AuthorizeUseCase(this.repository);
  @override
  Future<Either<Failure, AccessToken>> call(OAuthDTO params) {
    return repository.authorize(params);
  }
}
