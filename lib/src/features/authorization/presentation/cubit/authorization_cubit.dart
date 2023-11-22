import 'package:bloc/bloc.dart';
import 'package:wsc_auth/src/features/authorization/data/models/oauth_dto.dart';
import 'package:equatable/equatable.dart';

import '../../domain/usecases/authorize_usecase.dart';
part 'authorization_state.dart';

class OAuthCubit extends Cubit<OAuthState> {
  final AuthorizeUseCase useCase;
  OAuthCubit(this.useCase) : super(OAuthInitial());

  authorize(OAuthDTO dto) async {
    emit(OAuthLoading());
    final res = await useCase(dto);
    res.fold((l) => emit(OAuthFailed(l.toString())),
        (r) => emit(OAuthSuccess(token: r.token)));
  }
}
