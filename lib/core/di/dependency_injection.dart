import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:space_app/core/helpers/constants.dart';
import 'package:space_app/core/theming/app_theme_cubit/app_theme_cubit.dart';
import 'package:space_app/features/authentication/data/auth_repo.dart';
import 'package:space_app/features/authentication/logic/login_cubit/login_cubit.dart';
import 'package:space_app/features/authentication/logic/register_cubit/register_cubit.dart';
import 'package:space_app/features/dragons/data/repo/dragon_repo_impl.dart';
import 'package:space_app/features/dragons/logic/dragon_cubit.dart';
import 'package:space_app/features/profile/data/profile_repo.dart';
import 'package:space_app/features/profile/logic/all_profile_cubit.dart';
import 'package:space_app/features/profile/logic/edit_profile_data/edit_profile_cubit.dart';
import 'package:space_app/features/profile/logic/profile_cubit.dart';

import '../../features/dragons/data/repo/dragon_repo.dart';
import '../networking/api_service/dio_factory.dart';

import '../../features/localization/data/repos/localization_repo.dart';
import '../../features/localization/logic/localization_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async{

  final auth = FirebaseAuth.instance;
  getIt.registerLazySingleton(() => AuthRepo(auth));

  getIt.registerFactory(() => LoginCubit(getIt()));

  getIt.registerFactory(() => RegisterCubit(getIt()));



  /// Dio
  Dio dio = DioFactory.getDio();

  // Box of theme in hive local data
  final appThemeBox = await Hive.openBox(themeKey);

  // Dragons repo
  getIt.registerLazySingleton(() => DragonRepo(dio));
  getIt.registerLazySingleton(() => DragonRepoImpl(dragonRepo: getIt()));;

  // Dragon app_theme_cubit
  getIt.registerFactory(() => DragonCubit(dragonRepo: getIt()));

  // App theme app_theme_cubit
  getIt.registerFactory(() => AppThemeCubit(themeBox: appThemeBox));

  // Localization
  getIt.registerSingleton<LocalizationRepo>(LocalizationRepo());
  getIt.registerSingleton<LocalizationCubit>(LocalizationCubit());

  // Profile
  getIt.registerLazySingleton(() => ProfileRepo(auth));

  getIt.registerFactory(() => EditProfileCubit(getIt()));
  getIt.registerFactory(() => AllProfileCubit(getIt()));
  getIt.registerFactory(() => ProfileCubit(getIt()));
}
