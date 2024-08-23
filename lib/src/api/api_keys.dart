import 'package:get_it/get_it.dart';

/// To get an API key, sign up here:
/// https://home.openweathermap.org/users/sign_up
///

final sl = GetIt.instance;

void setupInjection() {
  sl.registerLazySingleton<String>(() => '68ce9e1e88bdb0b746c475ef1613f263',
      instanceName: 'api_key');
}
