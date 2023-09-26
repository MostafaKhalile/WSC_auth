import 'package:dartz/dartz.dart';
import 'package:wsc_auth/src/features/signup/data/models/signup_failed.dart';
import 'package:wsc_auth/src/features/signup/domain/entities/user.dart';
import 'package:wsc_auth/src/features/signup/signup_params.dart';

/*
╔═══════════════════════════════════════════════════╗
║ Created by Fady Fouad on 20/09/2023 at 14:58.     ║
║═══════════════════════════════════════════════════║
║ fady.fouad.a@gmail.com.                           ║
╚═══════════════════════════════════════════════════╝
*/

abstract class AuthRepository {
  Future<Either<SignupFailed, User>> signUp(SignupParamsInterface params);
}
