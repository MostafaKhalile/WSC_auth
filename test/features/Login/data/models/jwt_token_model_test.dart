import 'package:flutter_test/flutter_test.dart';
import 'package:wsc_auth/src/features/Login/domain/entities/jwt_token.dart';

void main() {
  const jwtToken = JWTToken(token: '_token_');
  test(
    'should  be a subclass of [JWTToken] entity',
    () async {
      // assert
      expect(jwtToken, isA<JWTToken>());
    },
  );
}
