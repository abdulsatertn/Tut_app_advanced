import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_app_advanced/app/app_prefs.dart';
import 'package:store_app_advanced/data/data_source/remote_data_source.dart';
import 'package:store_app_advanced/data/network/app_api.dart';
import 'package:store_app_advanced/data/network/dio_factory.dart';
import 'package:store_app_advanced/data/network/network_info.dart';
import 'package:store_app_advanced/data/repository/repositry_impl.dart';
import 'package:store_app_advanced/domain/reposetry/reposetry.dart';
import 'package:store_app_advanced/domain/use_case/login_use_case.dart';
import 'package:store_app_advanced/presentation/login/view_model/login_view_model.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  // app module , its a module here we put all generic dependencies .

  // shared prrefs instance
  final sharedPrefs = await SharedPreferences.getInstance();

  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

  // app prefs instance

  instance.registerLazySingleton<AppPreferences>(
      () => AppPreferences(instance<SharedPreferences>()));

  // Network info instance

  instance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(InternetConnectionChecker()));

  // dio factory instance
  instance.registerLazySingleton<DioFactory>(
      () => DioFactory(instance<AppPreferences>()));

  // app service client instance
  Dio dio = await instance<DioFactory>().getDio();
  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));

  // remote data source instance
  instance.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(instance<AppServiceClient>()));

  // repository instance
  instance.registerLazySingleton<Repository>(
      () => RepositoryImpl(instance(), instance()));
}

void initLoginModule() async {
  if (GetIt.I.isRegistered<LoginUseCase>()) {
    instance.registerFactory<LoginUseCase>(() => LoginUseCase(instance()));
    instance.registerFactory<LoginViewModel>(() => LoginViewModel(instance()));
  }
}
