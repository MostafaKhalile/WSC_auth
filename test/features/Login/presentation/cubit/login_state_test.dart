import 'package:flutter_test/flutter_test.dart';
import 'package:wsc_auth/src/features/Login/presentation/cubit/login_cubit.dart';

void main() {
  late LoginState state;

  group('LoginInitial State', () {
    test(
      'should be a subclass of LoginState',
      () async {
        // arrange
        state = LoginInitial();
        // assert
        expect(state, isA<LoginState>());
        expect(state.props.length, 0);
      },
    );
  });
  group('LoginInitial State', () {
    test(
      'should be a subclass of LoginState',
      () async {
        // arrange
        state = LoginLoading();
        // assert
        expect(state, isA<LoginState>());
      },
    );
  });
  group('LoginSuccess State', () {
    test(
      'should be a subclass of LoginState',
      () async {
        // arrange
        state = LoginSuccess(token: '');
        // assert
        expect(state, isA<LoginState>());
        expect(state.props.length, 1);
      },
    );
  });
  group('LoginLoading State', () {
    test(
      'should be a subclass of LoginState',
      () async {
        // arrange
        state = LoginFailed('');
        // assert
        expect(state, isA<LoginState>());
        expect(state.props.length, 1);
      },
    );
  });
}
