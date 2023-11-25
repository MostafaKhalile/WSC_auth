import 'package:wsc_auth/wsc_auth.dart';

Future<void> initOAuthFeature() async {
  // Bloc
  getIt.registerFactory<OAuthCubit>(() => OAuthCubit(
        getIt(),
      ));

  // Use cases
  getIt.registerLazySingleton(() => AuthorizeUseCase(getIt()));

  // Repository
  getIt.registerLazySingleton<OAuthRepository>(() => OAuthRepositoryImp(
        getIt(),
      ));

  // Data sources
  getIt.registerLazySingleton<OAuthAPIDataSource>(
      () => OAuthAPIDataImpl(getIt()));
}
