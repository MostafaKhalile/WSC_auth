import 'package:get_it/get_it.dart';

import 'src/features/authorization/injection_container.dart';
import 'wsc_auth.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  //External
  getIt.registerLazySingleton(() => ApiClient.instance);
  initOAuthFeature();
}
