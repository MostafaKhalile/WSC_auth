import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:wsc_auth/core/error/exceptions.dart';
import 'package:wsc_auth/src/features/Login/data/datasources/login_api_data_source.dart';
import 'package:wsc_auth/src/features/Login/data/models/credentials_dto.dart';
import 'package:wsc_auth/src/features/Login/data/models/jwt_token_model.dart';
import 'package:wsc_auth/wsc_auth.dart';

import '../../../../fixtures/fixture_reader.dart';

class MockApiClient extends Mock implements ApiClient {}

void main() {
  late LoginAPIDatasourceImpl dataSource;
  late CredentialsDTO credentialsDTO;
  late MockApiClient mockApiClient;

  setUpAll(() {
    mockApiClient = MockApiClient();
    dataSource = LoginAPIDatasourceImpl(mockApiClient);
    credentialsDTO = const CredentialsDTO(
        email: 'eve.holt@reqres.in', password: 'cityslicka');
  });

  group('LoginAPIDatasourceImpl', () {
    test('should make a POST request with credentials and return JWTTokenModel',
        () async {
      // arrange
      log('JWT ::${JWTTokenModel.fromJson(json.decode(fixture('token_response.json'))).toJson()}');
      // Mock the response from the mockApiClient
      when(() => mockApiClient.post(
            any(),
            body: credentialsDTO.toJson(),
          )).thenAnswer((_) async => Response(
            data: json.decode(fixture('token_response.json')),
            statusCode: 200,
            requestOptions: RequestOptions(),
          ));

      // act
      final result = await dataSource.login(credentialsDTO);

      // assert
      verify(() => mockApiClient.post(
            'login',
            body: credentialsDTO.toJson(),
          ));
      expect(result, isA<JWTTokenModel>());
    });

    test(
        'should return ServerException when the call to api is failed to get token',
        () async {
      // arrange
      when(() => mockApiClient.post(
            any(),
            body: credentialsDTO.toJson(),
          )).thenAnswer((_) async => Response(
            data: <String, dynamic>{},
            statusCode: 404,
            requestOptions: RequestOptions(),
          ));

      // assert
      expect(dataSource.login(credentialsDTO),
          throwsA(const TypeMatcher<ServerException>()));
    });
  });
}
