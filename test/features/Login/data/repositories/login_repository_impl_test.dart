import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:wsc_auth/core/error/failures.dart';
import 'package:wsc_auth/src/features/Login/data/data.dart';
import 'package:wsc_auth/src/features/Login/data/datasources/login_api_data_source.dart';
import 'package:wsc_auth/src/features/Login/data/models/credentials_dto.dart';
import 'package:wsc_auth/src/features/Login/domain/entities/jwt_token.dart';
import 'package:wsc_auth/src/features/Login/domain/repositories/login_repository.dart';

class LogInAPIDataSourceMock extends Mock implements LogInAPIDataSource {}

void main() {
  late LoginRepository repository;
  late LogInAPIDataSourceMock logInAPIDataSourceMock;
  late CredentialsDTO dto;

  /// Set up the test environment before each test case
  setUp(() {
    dto = const CredentialsDTO(email: '', password: '');
    logInAPIDataSourceMock = LogInAPIDataSourceMock();
    registerFallbackValue(logInAPIDataSourceMock);
    repository = LoginRepositoryImp(logInAPIDataSourceMock);
    registerFallbackValue(dto);
  });

  group(
      'Should return UserModel when the call to api is successful and Signup Failed when the call to api is failed',
      () {
    const jwtTokenModel = JWTTokenModel(token: '');
    const JWTTokenModel jwtToken = jwtTokenModel;
    test('should return [UserModel] when the call to api is successful',
        () async {
      // arrange
      when(() => logInAPIDataSourceMock.login(dto))
          .thenAnswer((_) async => jwtToken);

      // act
      final result = await repository.loginWithEmail(dto);

      // assert
      verify(() => repository.loginWithEmail(dto));
      expect(result, isA<Right<Failure, JWTToken>>());
    });

    test('should return SignupFailed when the call to api is failed', () async {
      // arrange
      when(() => logInAPIDataSourceMock.login(dto)).thenThrow(ServerFailure());

      // act
      final result = await repository.loginWithEmail(dto);
      // assert
      verify(() => repository.loginWithEmail(dto)).called(1);
      expect(result, isA<Left<Failure, JWTToken>>());
    });
  });
}
