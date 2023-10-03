import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:wsc_api_client/wsc_api_client.dart';
import 'package:wsc_auth/src/features/signup/data/data_sources/signup_datasource.dart';
import 'package:wsc_auth/src/features/signup/data/models/signup_failed.dart';
import 'package:wsc_auth/src/features/signup/data/models/user_model.dart';
import 'package:wsc_auth/src/features/signup/signup_params.dart';

class MockSignUpParams extends Mock implements SignupParamsInterface {}

void main() {
  late MockSignUpParams params;
  ApiClient.initialize(baseUrl: 'https://reqres.in/api');
  // test data source

  group('Should return UserModel when the call to api is successful', () {
    setUp(() {
      params = MockSignUpParams();
      // registerFallbackValue(params);
    });

    test('should return UserModel when the call to api is successful',
        () async {
      // arrange
      final apiClient = ApiClient.instance;
      const signUpPath = '/signup';
      final dataSource =
          SignUpDataSourceImpl(apiClient: apiClient, signUpPath: signUpPath);

      when(() => params.toJson()).thenAnswer((_)   => <String, dynamic> {
        'email': '',
        'password': '',
      });

      // act
      final result = await dataSource.signUp(params);
      verify(() => params.toJson());
      // assert
      expect(result, isA<UserModel>());
    });
  });

  /*
  setUp(() {
    params = MockSignUpParams();
    registerFallbackValue(params);
  });
  test('should return UserModel when the call to api is successful', () async {
    // arrange
    final apiClient = ApiClient.instance;
    const signUpPath = '/signup';
    final dataSource =
        SignUpDataSourceImpl(apiClient: apiClient, signUpPath: signUpPath);

    // act
    final result = await dataSource.signUp(params);
    // assert
    expect(result, isA<Right<SignupFailed, UserModel>>());
  });

  test('should return SignupFailed when the call to api is failed', () async {
    // arrange
    final apiClient = ApiClient.instance;
    const signUpPath = '/signup';
    final dataSource =
        SignUpDataSourceImpl(apiClient: apiClient, signUpPath: signUpPath);

    // act
    final result = await dataSource.signUp(params);
    // assert
    expect(result, isA<Left<SignupFailed, UserModel>>());
  });

  */
}
