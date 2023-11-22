import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:wsc_auth/core/error/failures.dart';
import 'package:wsc_auth/src/features/login/data/models/credentials_dto.dart';
import 'package:wsc_auth/src/features/login/domain/entities/jwt_token.dart';
import 'package:wsc_auth/src/features/login/domain/usecases/login_with_email.dart';
import 'package:wsc_auth/src/features/login/presentation/cubit/login_cubit.dart';

class LogInUseCaseMock extends Mock implements LogInUseCase {}

class CredentialsDTOMock extends Mock implements CredentialsDTO {}

class MockLoginCubit extends MockCubit<LoginState> implements LoginCubit {}

void main() {
  late CredentialsDTOMock dto;
  late LogInUseCaseMock logInUseCaseMock;
  late LoginCubit loginCubit;
  String token = '';
  setUpAll(() {
    logInUseCaseMock = LogInUseCaseMock();
    dto = CredentialsDTOMock();
    loginCubit = LoginCubit(logInUseCaseMock);
    registerFallbackValue(dto);
  });

  group('Initial State', () {
    test(
      'should be [LoginInitial]',
      () async {
        // arrange
        final initialState = loginCubit.state;
        // assert
        expect(initialState, isA<LoginInitial>());
      },
    );
  });
  group('login cubit', () {
    blocTest<LoginCubit, LoginState>(
      'should emit [LoginLoading,LoginSuccess] Respectivily when calling login with valid credentials',
      build: () {
        when(() => logInUseCaseMock.call(dto))
            .thenAnswer((_) async => Right(JWTToken(token: token)));
        return LoginCubit(logInUseCaseMock);
      },
      act: (cubit) => cubit.login(dto),
      expect: () => [
        isA<LoginLoading>(),
        isA<LoginSuccess>(),
      ],
    );
    blocTest<LoginCubit, LoginState>(
      'should emit [LoginLoading,LoginFailed] Respectivily when calling login with invalid credentials',
      build: () {
        when(() => logInUseCaseMock.call(any()))
            .thenAnswer((_) async => Left(ServerFailure()));
        return LoginCubit(logInUseCaseMock);
      },
      act: (cubit) => cubit.login(dto),
      expect: () => [
        isA<LoginLoading>(),
        isA<LoginFailed>(),
      ],
    );
  });
}
