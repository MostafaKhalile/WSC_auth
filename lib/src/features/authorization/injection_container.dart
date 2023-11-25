import 'package:wsc_auth/wsc_auth.dart';

Future<void> initOAuthFeature() async {
  // Bloc
  getItInjector.registerFactory<OAuthCubit>(() => OAuthCubit(
        getItInjector(),
      ));

  // Use cases
  getItInjector.registerLazySingleton(() => AuthorizeUseCase(getItInjector()));

  // Repository
  getItInjector.registerLazySingleton<OAuthRepository>(() => OAuthRepositoryImp(
        getItInjector(),
      ));

  // Data sources
  getItInjector.registerLazySingleton<OAuthAPIDataSource>(
      () => OAuthAPIDataImpl(getItInjector()));
}
