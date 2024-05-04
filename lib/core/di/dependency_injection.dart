import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:space_app/core/theming/app_theme_cubit/app_theme_cubit.dart';
import 'package:space_app/features/dragons/data/repo/dragon_local_repo.dart';
import 'package:space_app/features/dragons/data/repo/dragon_repo_impl.dart';
import 'package:space_app/features/dragons/logic/dragon_cubit.dart';
import 'package:space_app/features/landpods/data/landpod_repo.dart';
import 'package:space_app/features/landpods/data/landpod_repo_impl.dart';
import 'package:space_app/features/landpods/logic/landpod_cubit.dart';

import '../../features/dragons/data/repo/dragon_repo.dart';
import '../networking/api_service/dio_factory.dart';

import '../../features/localization/data/repos/localization_repo.dart';
import '../../features/localization/logic/localization_cubit.dart';
import '../networking/internet_checker.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async{

  /// Dio
  Dio dio = DioFactory.getDio();

  // Internet Connection Checker
  getIt.registerLazySingleton(() => InternetConnectionChecker());
  getIt.registerLazySingleton(() => InternetCheckerImpl(getIt()));

  // Initial local data
  final sharedPref = await SharedPreferences.getInstance();
  // Dragons repo
  getIt.registerLazySingleton(() => DragonRepo(dio));
  getIt.registerLazySingleton(() => DragonRepoImpl(dragonRepo: getIt()));

  /// Dragon local repo
  getIt.registerLazySingleton(() => DragonLocalRepo(sharedPreferences: sharedPref));

  // Dragon app_theme_cubit
  getIt.registerFactory(() => DragonCubit(dragonRepo: getIt(),internetChecker: getIt(), dragonLocalRepo: getIt()));

  // App theme app_theme_cubit
  getIt.registerFactory(() => AppThemeCubit(sharedPref: sharedPref));

  // Localization
  getIt.registerSingleton<LocalizationRepo>(LocalizationRepo());
  getIt.registerSingleton<LocalizationCubit>(LocalizationCubit());

  // Landpods
  getIt.registerLazySingleton<LandpodRepo>(() => LandpodRepo(dio));
  getIt.registerLazySingleton<LandpodRepoImpl>(() => LandpodRepoImpl(landpodRepo: getIt()));
  getIt.registerFactory<LandpodCubit>(() => LandpodCubit(landpodRepo: getIt<LandpodRepoImpl>()));

}
