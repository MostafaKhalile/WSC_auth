import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:wsc_auth/wsc_auth.dart';

class LoginRepositoryMock extends Mock implements LoginRepository {}

void main() {
  late final LoginRepositoryMock loginRepositoryMock;
  late final LogInUseCase useCase;

  setUp(() {
    registerFallbackValue(const CredentialsDTO(email: '', password: ''));

    loginRepositoryMock = LoginRepositoryMock();
    useCase = LogInUseCase(loginRepositoryMock);
  });
  test(
    'should Return [JWTToken] from the Repository on calling [loginWithEmail]',
    () async {
      // arrange
      const JWTTokenModel tokenResponse = JWTTokenModel(token: '_toke_');

      // act
      when(() => loginRepositoryMock.loginWithEmail(any())).thenAnswer(
        (_) async => const Right(tokenResponse),
      );

      // assert
      CredentialsDTO params = const CredentialsDTO(email: '', password: '');
      final result = await useCase(params);
      expect(result, const Right(tokenResponse));
      verify(() => loginRepositoryMock.loginWithEmail(params));
      verifyNoMoreInteractions(loginRepositoryMock);
    },
  );
}
