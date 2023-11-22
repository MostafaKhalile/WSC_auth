import 'package:flutter_test/flutter_test.dart';
import 'package:wsc_auth/src/features/login/data/models/credentials_dto.dart';

void main() {
  const credentialsDTO = CredentialsDTO(
    email: 'email',
    password: 'password',
  );
  test(
    'should  be a subclass of [credentialsDTO] entity',
    () async {
      // assert
      expect(credentialsDTO, isA<CredentialsDTO>());
    },
  );

  group('toJson', () {
    test(
      'should return a JSON map containing the proper data',
      () async {
        // act
        final result = credentialsDTO.toJson();
        // assert
        final expectedJsonMap = {'email': 'email', 'password': 'password'};
        expect(result, expectedJsonMap);
      },
    );
  });

  test(
    'should include email and password',
    () async {
      // act
      final props = credentialsDTO.props;
      // assert
      expect(props.length, 2);
    },
  );
}
