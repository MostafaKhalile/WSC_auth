import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:wsc_auth/src/features/signup/data/models/user_model.dart';
import 'package:wsc_auth/src/features/signup/domain/domain.dart';
import 'package:wsc_auth/src/features/signup/domain/repositories/auth_repository.dart';
import 'package:wsc_auth/src/features/signup/signup_params.dart';

/*
╔═══════════════════════════════════════════════════╗
║ Created by Fady Fouad on 20/09/2023 at 15:04.     ║
║═══════════════════════════════════════════════════║
║ fady.fouad.a@gmail.com.                           ║
╚═══════════════════════════════════════════════════╝
*/

// Define mock classes for testing
class MockSignUpRepository extends Mock implements AuthRepository {}

class MockSignUpParams extends Mock implements SignupParamsInterface {}

void main() {
  late MockSignUpRepository repository;
  late MockSignUpParams params;
  late SignUpUseCase signUp;

  // Set up the test environment before each test case
  setUp(() {
    repository = MockSignUpRepository();
    params = MockSignUpParams();
    signUp = SignUpUseCaseImpl(repository: repository);
  });

  // Define a test user object for use in testing
  UserModel testUser = UserModel(
    id: "1",
    name: "Test User",
    email: "",
    phone: "",
    image: "",
    token: "",
  );

  // Test case for a successful sign up
  test('should return user when sign up is successful', () async {
    // arrange
    when(() => repository.signUp(params)).thenAnswer(
      (_) async => Right(testUser),
    );

    // act
    final result = await signUp.execute(params);

    // assert
    expect(
      result,
      // Match the expected type to the actual type
      Right(testUser),
    );

    // Verify that the repository's signUp method was called
    verify(() => repository.signUp(params));

    // Verify that there are no more interactions with the repository
    verifyNoMoreInteractions(repository);
  });
}
