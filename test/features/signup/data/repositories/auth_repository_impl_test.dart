import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:wsc_api_client/wsc_api_client.dart';
import 'package:wsc_auth/src/features/signup/data/data.dart';
import 'package:wsc_auth/src/features/signup/data/models/signup_failed.dart';
import 'package:wsc_auth/src/features/signup/data/models/user_model.dart';
import 'package:wsc_auth/src/features/signup/domain/repositories/auth_repository.dart';

import '../../mocks/mock_signup_params.dart';
import '../../mocks/mock_signup_remote_datasource.dart';

UserModel testUser = const UserModel(
  id: "1",
  name: "Test User",
  email: "",
  phone: "",
  image: "",
  token: "",
);

void main() {
  late AuthRepository repository;
  late MockSignUpParams params;
  late MockSignUpRemoteDatasource signUp;

  /// Set up the test environment before each test case
  setUp(() {
    params = MockSignUpParams();
    ApiClient.initialize(baseUrl: 'https://reqres.in/api');
    signUp = MockSignUpRemoteDatasource();
    registerFallbackValue(signUp);
    repository = AuthRepositoryImpl(signUp);
    registerFallbackValue(params);
  });

  group(
      'Should return UserModel when the call to api is successful and Signup Failed when the call to api is failed',
      () {
    test('should return [UserModel] when the call to api is successful',
        () async {
      // arrange
      when(() => signUp.signUp(params)).thenAnswer((_) async => (testUser));

      // act
      final result = await repository.signUp(params);

      // assert
      verify(() => signUp.signUp(params));
      expect(result, isA<Right<SignupFailed, UserModel>>());
    });

    test('should return SignupFailed when the call to api is failed', () async {
      // arrange
      when(() => signUp.signUp(params))
          .thenThrow(SignupFailed());

      // act
      final result = await repository.signUp(params);
      // assert
      verify(() => signUp.signUp(params)).called(1);
      expect(result, isA<Left<SignupFailed, UserModel>>());
    });
  });
}
