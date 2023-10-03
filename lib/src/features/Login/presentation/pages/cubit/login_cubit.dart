import 'package:bloc/bloc.dart';

import '../../../domain/usecases/login_with_email.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LogInUseCase useCase;
  LoginCubit(this.useCase) : super(LoginInitial());

  login(Params params) async {
    emit(LoginLoading());
    final res = await useCase(params);
    res.fold((l) => emit(LoginFailed(l.toString())),
        (r) => emit(LoginSuccess(r.token)));
  }
}
