import 'package:flutter_test/flutter_test.dart';
import 'package:wsc_auth/core/error/exceptions.dart';

void main() {
  group('ServerException', () {
    test('should implement Exception', () async {
      Exception serverException = ServerException();

      // assert
      expect(serverException, isA<Exception>());
      expect(serverException, isA<ServerException>());
    });
  });
}
