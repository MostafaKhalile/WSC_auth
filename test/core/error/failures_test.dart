import 'package:flutter_test/flutter_test.dart';
import 'package:wsc_auth/core/error/failures.dart';

void main() {
  group('Failure', () {
    test(
      'should be empty',
      () async {
        // arrange
        Failure failure = ServerFailure();
        // act
        final props = failure.props;
        // assert
        expect(props.length, 0);
      },
    );
    test(
      'should be equal opjects',
      () async {
        // arrange
        Failure failure_1;
        Failure failure_2;
        // act
        failure_1 = ServerFailure();
        failure_2 = ServerFailure();
        // assert

        expect(failure_1 == failure_2, true);
      },
    );
  });
  group('ServerFailure', () {
    test(
      'should be inherited from Failure ',
      () async {
        // act
        ServerFailure failure = ServerFailure();

        // assert
        expect(failure, isA<Failure>());
      },
    );
  });
}
