import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wsc_auth/src/features/login/data/models/credentials_dto.dart';

import '../../domain/usecases/login_with_email.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LogInUseCase useCase;
  LoginCubit(this.useCase) : super(LoginInitial());

  login(CredentialsDTO dto) async {
    emit(LoginLoading());
    final res = await useCase(dto);
    res.fold((l) => emit(LoginFailed(l.toString())),
        (r) => emit(LoginSuccess(token: r.token)));
  }
}
