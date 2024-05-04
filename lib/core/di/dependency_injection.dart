import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:space_app/core/networking/api_service/api_service.dart';
import 'package:space_app/core/theming/app_theme_cubit/app_theme_cubit.dart';
import 'package:space_app/features/dragons/data/repo/dragon_repo_impl.dart';
import 'package:space_app/features/dragons/logic/dragon_cubit.dart';
import 'package:space_app/features/rockets/data/repo/rockets_repo_impl.dart';
import 'package:space_app/features/rockets/logic/rockets_cubit/rockets_cubit.dart';
import 'package:space_app/features/landpods/data/landpod_repo_impl.dart';
import 'package:space_app/features/landpods/logic/landpod_cubit.dart';
import '../networking/api_service/dio_factory.dart';
import '../../features/localization/data/repos/localization_repo.dart';
import '../../features/localization/logic/localization_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async{

  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // Initial local data
  final sharedPref = SharedPreferences.getInstance();
  // Dragons
  getIt.registerLazySingleton<DragonRepoImpl>(() => DragonRepoImpl(apiService: getIt(),));
  getIt.registerFactory<DragonCubit>(() => DragonCubit(dragonRepo: getIt(),));


  // App theme app_theme_cubit
  getIt.registerFactory(() => AppThemeCubit(sharedPref: sharedPref));

  // Localization
  getIt.registerSingleton<LocalizationRepo>(LocalizationRepo());
  getIt.registerSingleton<LocalizationCubit>(LocalizationCubit());

  // Landpods
  getIt.registerLazySingleton<LandpodRepoImpl>(() => LandpodRepoImpl(apiService: getIt(),));
  getIt.registerFactory<LandpodCubit>(() => LandpodCubit(landpodRepo: getIt(),));


  // Rockets
  getIt.registerLazySingleton<RocketsRepoImpl>(() => RocketsRepoImpl(apiService: getIt(),));
  getIt.registerFactory<RocketsCubit>(() => RocketsCubit( rocketsRepo: getIt(),));


}
