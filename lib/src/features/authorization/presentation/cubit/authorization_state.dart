part of 'authorization_cubit.dart';

sealed class OAuthState extends Equatable {}

final class OAuthInitial extends OAuthState {
  @override
  List<Object?> get props => [];
}

final class OAuthLoading extends OAuthState {
  @override
  List<Object?> get props => [];
}

final class OAuthSuccess extends OAuthState {
  final String token;

  OAuthSuccess({required this.token});

  @override
  List<Object?> get props => [token];
}

final class OAuthFailed extends OAuthState {
  final String error;

  OAuthFailed(this.error);

  @override
  List<Object?> get props => [error];
}
