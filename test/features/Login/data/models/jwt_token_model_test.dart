import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:wsc_auth/src/features/Login/data/data.dart';
import 'package:wsc_auth/src/features/Login/domain/entities/jwt_token.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  const jwtToken = JWTTokenModel(token: '_token_');
  test(
    'should  be a subclass of [JWTToken] entity',
    () async {
      // assert
      expect(jwtToken, isA<JWTToken>());
    },
  );

  group('fromJson', () {
    test(
      'should return a valid [JWTToken] model when the json is valid with token',
      () async {
        // arrange
        final Map<String, dynamic> jsonMap =
            json.decode(fixture('token_response.json'));
        // act
        JWTTokenModel fromJson = JWTTokenModel.fromJson(jsonMap);
        // assert

        expect(fromJson, jwtToken);
      },
    );
  });

  group('toJson', () {
    test(
      'should return a JSON map containing the proper data',
      () async {
        // act
        final result = jwtToken.toJson();
        // assert
        final expectedJsonMap = {"token": '_token_'};
        expect(result, expectedJsonMap);
      },
    );
  });
}
