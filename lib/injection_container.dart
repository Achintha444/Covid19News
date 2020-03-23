import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'core/Platform/network_info.dart';
import 'core/util/input_converter.dart';
import 'features/covid_19/data/datasources/covid_local_data_source.dart';
import 'features/covid_19/data/datasources/covid_remote_data_source.dart';
import 'features/covid_19/data/repos/covid_repo_impl.dart';
import 'features/covid_19/domain/repos/covid_repo.dart';
import 'features/covid_19/domain/usecases/get_all_covid_info.dart';
import 'features/covid_19/domain/usecases/get_country_specific_covid_info.dart';
import 'features/covid_19/domain/usecases/get_lk_specific_covid_info.dart';
import 'features/covid_19/presentation/bloc/covid_bloc.dart';
import 'features/splash_screen/data/repos/splash_scree_repo_impl.dart';
import 'features/splash_screen/domain/repos/splash_screen_repo.dart';
import 'features/splash_screen/domain/usecases/navigate_to_main_screen.dart';
import 'features/splash_screen/presentation/bloc/splash_screen_bloc.dart';

final sl = GetIt.instance;
Future<void> init() async {
  //! Features - splash_screen

  //* Bloc
  sl.registerFactory(
    () => SplashScreenBloc(
      navigateToMainScreen: sl(),
    ),
  );

  //* usecases
  sl.registerLazySingleton(
    () => NavigateToMainScreen(
      splashScreenRepo: sl(),
    ),
  );

  //* repo

  sl.registerLazySingleton<SplashScreenRepo>(
    () => SplashScreenRepoImpl(
      networkInfo: sl(),
    ),
  );

  //! Features - covid_19

  //* Bloc
  sl.registerFactory(() => CovidBloc(
      getAllCovidInfo: sl(),
      getCountrySpecifiCovidInfo: sl(),
      getLKSpecifiCovidInfo: sl(),
      inputConverter: sl()));

  //* usecases
  sl.registerLazySingleton(() => GetAllCovidInfo(repo: sl()));
  sl.registerLazySingleton(() => GetCountrySpecifiCovidInfo(repo: sl()));
  sl.registerLazySingleton(() => GetLKSpecifiCovidInfo(repo: sl()));

  //* repo
  sl.registerLazySingleton<CovidRepo>(
    () => CovidRepoImpl(
        covidRemoteDataSource: sl(),
        covidLocalDataSource: sl(),
        networkInfo: sl()),
  );

  //* datasource
  sl.registerLazySingleton<CovidLocalDataSource>(
    () => CovidLocalDataSourceImpl(sharedPreferences: sl()),
  );
  sl.registerLazySingleton<CovidRemoteDataSource>(
    () => CovidRemoteDataSourceImpl(httpClient: sl()),
  );

  //! Core
  sl.registerLazySingleton(() => InputConverter());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! External Libraries
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => DataConnectionChecker());
}
