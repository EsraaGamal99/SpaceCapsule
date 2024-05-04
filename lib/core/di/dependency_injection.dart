import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:space_app/core/theming/app_theme_cubit/app_theme_cubit.dart';
import 'package:space_app/features/dragons/data/repo/dragon_repo_impl.dart';
import 'package:space_app/features/dragons/logic/dragon_cubit.dart';
import 'package:space_app/features/rockets/data/repo/rockets_repo.dart';
import 'package:space_app/features/rockets/data/repo/rockets_repo_impl.dart';
import 'package:space_app/features/rockets/logic/rockets_cubit/rockets_cubit.dart';
import 'package:space_app/features/landpods/data/landpod_repo.dart';
import 'package:space_app/features/landpods/data/landpod_repo_impl.dart';
import 'package:space_app/features/landpods/logic/landpod_cubit.dart';

import '../../features/dragons/data/repo/dragon_repo.dart';
import '../networking/api_service/dio_factory.dart';
import '../../features/localization/data/repos/localization_repo.dart';
import '../../features/localization/logic/localization_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async{

  /// Dio
  Dio dio = DioFactory.getDio();

  // Initial local data
  final sharedPref = SharedPreferences.getInstance();
  // Dragons repo
  getIt.registerLazySingleton(() => DragonRepo(dio));
  getIt.registerLazySingleton(() => DragonRepoImpl(dragonRepo: getIt()));

  // Dragon app_theme_cubit
  getIt.registerFactory(() => DragonCubit(dragonRepo: getIt()));

  // App theme app_theme_cubit
  getIt.registerFactory(() => AppThemeCubit(sharedPref: sharedPref));

  // Localization
  getIt.registerSingleton<LocalizationRepo>(LocalizationRepo());
  getIt.registerSingleton<LocalizationCubit>(LocalizationCubit());

  // Landpods
  getIt.registerLazySingleton<LandpodRepo>(() => LandpodRepo(dio));
  getIt.registerLazySingleton<LandpodRepoImpl>(() => LandpodRepoImpl(landpodRepo: getIt()));
  getIt.registerFactory<LandpodCubit>(() => LandpodCubit(landpodRepo: getIt<LandpodRepoImpl>()));


  // Rockets
  getIt.registerLazySingleton(() => RocketsRepo(dio));
  getIt.registerLazySingleton(() => RocketsRepoImpl(rocketsRepo: getIt()));
  getIt.registerFactory(() => RocketsCubit(rocketsRepo: getIt()));


}
