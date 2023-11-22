import 'package:dartz/dartz.dart';
import 'package:wsc_auth/src/features/signup/data/models/signup_failed.dart';
import 'package:wsc_auth/src/features/signup/data/models/user_model.dart';
import 'package:wsc_auth/src/features/signup/domain/repositories/auth_repository.dart';
import 'package:wsc_auth/src/features/signup/domain/use_cases/sign_up_with_email_usecase.dart';
import 'package:wsc_auth/src/features/signup/signup.dart';

/*
╔═══════════════════════════════════════════════════╗
║ Created by Fady Fouad on 26/09/2023 at 14:32.     ║
║═══════════════════════════════════════════════════║
║ fady.fouad.a@gmail.com.                           ║
╚═══════════════════════════════════════════════════╝
*/

class SignUpUseWithPhoneCaseImpl<T> extends SignUpUseCase {
  final AuthRepository repository;

  SignUpUseWithPhoneCaseImpl({required this.repository});

  @override
  Future<Either<SignupFailed, UserModel>> execute(
      SignupParamsInterface params) {
    return repository.signUp(params);
  }
}
