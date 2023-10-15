import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:wsc_auth/src/features/Login/data/datasources/login_api_data_source.dart';
import 'package:wsc_auth/src/features/Login/data/models/credentials_dto.dart';
import 'package:wsc_auth/src/features/Login/data/models/jwt_token_model.dart';
import 'package:wsc_auth/wsc_auth.dart';

import '../../../../fixtures/fixture_reader.dart';

class MockApiClient extends Mock implements ApiClient {}

class MockDio extends Mock implements Dio {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  ApiClient.initialize(baseUrl: 'https://reqres.in/api/');
  late LoginAPIDatasourceImpl dataSource;

  setUp(() {
    final mockApiClient = MockApiClient();
    dataSource = LoginAPIDatasourceImpl();
    dataSource.apiClient = mockApiClient;
  });

  // void setUpMockHttpClientSuccess200() {
  //   when(() => mockDio.post(
  //         any(),
  //         data: any(named: 'data'),
  //         queryParameters: any(named: 'queryParameters'),
  //         options: any(named: 'options'),
  //       )).thenAnswer((_) async => Response(
  //         data: fixture('token_response.json'),
  //         statusCode: 200,
  //         requestOptions: RequestOptions(),
  //       ));
  // }

  group('LoginAPIDatasourceImpl', () {
    test('should make a POST request with credentials and return JWTTokenModel',
        () async {
      // arrange
      final credentialsDTO = CredentialsDTO('eve.holt@reqres.in', 'cityslicka');
      final mockApiClient = dataSource.apiClient as MockApiClient;

      // Mock the response from the mockApiClient
      when(() => mockApiClient.post(
            any(),
            attachToken: any(named: 'attachToken'),
            body: any(named: 'body'),
          )).thenAnswer((_) async => Response(
            data: fixture('token_response.json'),
            statusCode: 200,
            requestOptions: RequestOptions(),
          ));

      // act
      final result = await dataSource.login(credentialsDTO);

      // assert
      expect(result, isA<JWTTokenModel>());
      verify(() => mockApiClient.post(
            'login',
            attachToken: false,
            body: credentialsDTO.toJson(),
          ));
    });
  });
}
