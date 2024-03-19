import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_app_advanced/app/app_prefs.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  // app module , its a module here we put all generic dependencies .

  // shared prrefs instance
  final sharedPrefs = await SharedPreferences.getInstance();

  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

  // app prefs instance

  instance.registerLazySingleton<AppPreferences>(
      () => AppPreferences(instance<SharedPreferences>()));
}

Future<void> initLoginModule() async {}
