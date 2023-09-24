import 'package:dartz/dartz.dart';
import 'package:wsc_auth/src/features/signup/data/models/signup_failed.dart';
import 'package:wsc_auth/src/features/signup/domain/entities/user.dart';
import 'package:wsc_auth/src/features/signup/domain/repositories/auth_repository.dart';
import 'package:wsc_auth/src/features/signup/signup_params.dart';

/*
╔═══════════════════════════════════════════════════╗
║ Created by Fady Fouad on 20/09/2023 at 15:04.     ║
║═══════════════════════════════════════════════════║
║ fady.fouad.a@gmail.com.                           ║
╚═══════════════════════════════════════════════════╝
*/

abstract class SignUpUseCase {
  Future<Either<SignupFailed, User>> execute(SignupParamsInterface params);
}

class SignUpUseCaseImpl extends SignUpUseCase {
  final AuthRepository repository;

  SignUpUseCaseImpl({required this.repository});

  @override
  Future<Either<SignupFailed, User>> execute(SignupParamsInterface params) {
    return repository.signUp(params);
  }
}
