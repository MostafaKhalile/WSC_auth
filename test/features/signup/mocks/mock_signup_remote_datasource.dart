import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';
import 'package:wsc_auth/src/features/signup/data/data.dart';
import 'package:wsc_auth/src/features/signup/domain/repositories/auth_repository.dart';
import 'package:wsc_auth/src/features/signup/signup_params.dart';

/*
╔═══════════════════════════════════════════════════╗
║ Created by Fady Fouad on 02/10/2023 at 10:23.     ║
║═══════════════════════════════════════════════════║
║ fady.fouad.a@gmail.com.                           ║
╚═══════════════════════════════════════════════════╝
*/

// Define mock classes for testing
class MockSignUpRemoteDatasource extends Mock implements SignUpDataSource {}
