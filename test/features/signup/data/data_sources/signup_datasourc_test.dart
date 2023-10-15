import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:wsc_api_client/wsc_api_client.dart';
import 'package:wsc_auth/src/features/signup/data/data_sources/signup_datasource.dart';
import 'package:wsc_auth/src/features/signup/data/models/signup_failed.dart';
import 'package:wsc_auth/src/features/signup/data/models/user_model.dart';
import 'package:wsc_auth/src/features/signup/signup_params.dart';

class MockSignUpParams extends Mock implements SignupParamsInterface {}
class MockApiClient extends Mock implements ApiClient {}

const signUpPath = '/signup';
void main() {
  late  MockSignUpParams params;
  late SignUpParams paramsObj;
  late SignUpDataSource dataSource;
  late MockApiClient mockApiClient;
  // late ApiClient client;
  // ApiClient.initialize(baseUrl: 'https://reqres.in/api');

  group('Should return UserModel when the call to api is successful', () {
    setUp(() {
      // client = ApiClient.instance;
      mockApiClient = MockApiClient();
      params = MockSignUpParams();
      paramsObj = SignUpParams(email: '', password: '');
      dataSource = SignUpDataSourceImpl(
          apiClient: mockApiClient, signUpPath: signUpPath);
    });

    test('should return UserModel when the call to api is successful',
        () async {
      // arrange
      when(() => params.toJson()).thenAnswer((_) => <String, dynamic>{
            'email': '',
            'password': '',
          });
      when(() => mockApiClient.post(
            signUpPath,
            body: paramsObj.toJson(),
          )).thenAnswer((_) async => Response(
            data: <String, dynamic>{
              'id': '1',
              'name': 'Test User',
              'email': '',
              'phone': '',
              'image': '',
              'token': '',
            },
            statusCode: 200,
            requestOptions: RequestOptions(path: ''),
          ));

      // act
      final result = await dataSource.signUp(paramsObj);

      // assert
      verify(() => mockApiClient.post(
            signUpPath,
            body: paramsObj.toJson(),
          ));
      expect(params, isA<SignupParamsInterface>());
      expect(result, isA<UserModel>());
    });


  });


  group('Should return SignupFailed when the call to api is failed', () {
    setUp(() {
      // final apiClient = ApiClient.instance;
      mockApiClient = MockApiClient();
      params = MockSignUpParams();
      paramsObj = SignUpParams(email: '', password: '');
      dataSource = SignUpDataSourceImpl(
          apiClient: mockApiClient, signUpPath: signUpPath);
    });

    test('should return SignupFailed when the call to api is failed', () async {
      // arrange
      when(() => mockApiClient.post(
        signUpPath,
        body: paramsObj.toJson(),
      )).thenAnswer((_) async => Response(
        data: <String, dynamic>{},
        statusCode: 500,
        requestOptions: RequestOptions(path: ''),
      ));

      // act

      // assert
      expect(dataSource.signUp(paramsObj), throwsA(const TypeMatcher<SignupFailed>()));
    });
  });

}

class SignUpParams extends SignupParamsInterface {
  SignUpParams({
    required String email,
    required String password,
  }) : super(email: 'null', password: '', name: '', phone: '');


  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'email': email,
        'password': password,
      };
}
