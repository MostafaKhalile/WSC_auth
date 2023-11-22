import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:wsc_auth/src/features/Login/presentation/cubit/login_cubit.dart';
import 'package:wsc_auth/src/features/signup/data/models/signup_failed.dart';
import 'package:wsc_auth/src/features/signup/data/models/user_model.dart';
import 'package:wsc_auth/src/features/signup/domain/use_cases/sign_up_with_email_usecase.dart';
import 'package:wsc_auth/src/features/signup/presentation/logic/auth_bloc.dart';
import 'package:wsc_auth/src/features/signup/signup_params.dart';

class MockSignUpUseCase extends Mock implements SignUpUseCase {}

class MockSignUpParams extends Mock implements SignupParamsInterface {}

void main() {
  late AuthBloc signupBloc;
  late MockSignUpUseCase mockSignUpUseCase;
  late MockSignUpParams mockSignUpParams;
  UserModel testUser = const UserModel(
    id: "1",
    name: "Test User",
    email: "",
    phone: "",
    image: "",
    token: "",
  );

  group('Signup Bloc', () {
    setUp(() {
      mockSignUpUseCase = MockSignUpUseCase();
      mockSignUpParams = MockSignUpParams();
      signupBloc = AuthBloc(mockSignUpUseCase);
      // registerFallbackValue(mockSignUpParams);
    });

    blocTest<AuthBloc, AuthState>(
      'should emit [AuthLoading, Authenticated] when signup is successful',
      build: () {
        when(() => mockSignUpUseCase.execute(mockSignUpParams))
            .thenAnswer((_) async => Right(testUser));
        return signupBloc;
      },
      act: (bloc) => bloc.signUp(mockSignUpParams),
      expect: () => [
        AuthLoading(),
        Authenticated(user: testUser),
      ],
    );

    // failure case
    blocTest<AuthBloc, AuthState>(
      'should emit [AuthLoading, AuthError] when signup is unsuccessful',
      build: () {
        when(() => mockSignUpUseCase.execute(mockSignUpParams))
            .thenAnswer((_) async => Left(SignupFailed()));
        return signupBloc;
      },
      act: (bloc) => bloc.signUp(mockSignUpParams),
      expect: () => [
        AuthLoading(),
        const AuthError(message: ''),
      ],
    );
  });
}
