import 'package:get_it/get_it.dart';

import 'src/features/authorization/injection_container.dart';
import 'wsc_auth.dart';

final getItInjector = GetIt.instance;

Future<void> boot() async {
  //External
  getItInjector.registerLazySingleton(() => ApiClient.instance);
  initOAuthFeature();
}
