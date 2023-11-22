import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:wsc_auth/core/usecases/usecase.dart';

class MockUseCase extends Mock implements UseCase {}

void main() {
  late MockUseCase useCaseMock;
  setUp(() => useCaseMock = MockUseCase());
  test(
    'should be a callable class ',
    () async {
      //arrange
      when(() => useCaseMock.call(any())).thenAnswer(
        (invocation) async => const Right(null),
      );
      // act
      useCaseMock(null);
      // assert
      verify(() => useCaseMock.call(null));
    },
  );
  group('NoParams', () {
    test(
      'should have 0 props for Equatable',
      () async {
        // arrange
        final NoParams noParams = NoParams();
        // act
        final props = noParams.props;
        // assert

        expect(props.length, 0);
      },
    );
  });
}
