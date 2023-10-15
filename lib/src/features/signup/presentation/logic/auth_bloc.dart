import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wsc_auth/src/features/signup/data/models/user_model.dart';
import 'package:wsc_auth/src/features/signup/domain/use_cases/sign_up_with_email_usecase.dart';
import 'package:wsc_auth/src/features/signup/signup_params.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignUpUseCase useCase;

  AuthBloc(this.useCase) : super(AuthInitial()) {
    on<SignUpEvent>(_signUp);
  }

  Future<void> _signUp(SignUpEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final result = await useCase.execute(event.params);
    result.fold(
      (l) => emit(AuthError(
        message: l.message ?? '',
      )),
      (r) => emit(Authenticated(user: r)),
    );
  }

  Future<void> signUp(SignupParamsInterface params) async {
    add(SignUpEvent(params:params));
  }
}
