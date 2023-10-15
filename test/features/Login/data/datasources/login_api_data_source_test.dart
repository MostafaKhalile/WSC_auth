import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:wsc_auth/src/features/Login/data/datasources/login_api_data_source.dart';
import 'package:wsc_auth/src/features/Login/data/models/credentials_dto.dart';
import 'package:wsc_auth/wsc_auth.dart';

import '../../../../fixtures/fixture_reader.dart';

class MockApiClient extends Mock implements ApiClient {}

class MockDio extends Mock implements Dio {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  ApiClient.initialize(baseUrl: 'https://reqres.in/api/');
  late LoginAPIDatasourceImpl dataSource;
  late MockDio mockDio;
  final CredentialsDTO credentialsDTO =
      CredentialsDTO('eve.holt@reqres.in', 'cityslicka');
  setUp(() {
    mockDio = MockDio();
    ApiClient.instance.dio = mockDio;
    dataSource = LoginAPIDatasourceImpl();
  });

  void setUpMockHttpClientSuccess200() {
    when(() => mockDio.post(
          any(),
          data: any(named: 'data'),
          queryParameters: any(named: 'queryParameters'),
          options: any(named: 'options'),
        )).thenAnswer((_) async => Response(
          data: fixture('token_response.json'),
          statusCode: 200,
          requestOptions: RequestOptions(),
        ));
  }

  group('Login DataSource', () {
    test(
      'should perform a POST request on a URL with CredentialsDTO being the endpoint and with application/json header',
      () async {
        // arrange

        final mockDio = ApiClient.instance.dio as MockDio;

        // Mock the response from Dio
        setUpMockHttpClientSuccess200();

        // act
        await dataSource.login(credentialsDTO);

        // assert
        verify(() => mockDio.post(
              'login',
              data: credentialsDTO.toJson(),
              options: Options(
                headers: {
                  'Accept': 'application/json',
                  'Content-Type': 'application/json',
                },
              ),
            ));
      },
    );
  });
}
