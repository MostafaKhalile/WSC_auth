import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../login.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  login(Object body) async {
    emit(LoginLoading());
    try {
      final res = await LoginService.login(body: body);
      if (res?.statusCode == HttpStatus.ok) {
        emit(LoginSuccess(res?.data['token']));
      } else {
        emit(LoginFailed(res?.data['message'] ?? 'Server Error'));
      }
    } catch (e, st) {
      emit(LoginFailed(e.toString()));
      log(e.toString(), stackTrace: st);
    }
  }
}
