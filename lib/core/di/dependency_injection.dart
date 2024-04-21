import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:space_app/features/dragons/data/repo/dragon_repo_impl.dart';
import 'package:space_app/features/dragons/logic/dragon_cubit.dart';

import '../../features/dragons/data/repo/dragon_repo.dart';
import '../networking/api_service/dio_factory.dart';


final getIt = GetIt.instance;

Future<void> setupGetIt() async{

  /// Dio
  Dio dio = DioFactory.getDio();

  /// dragons repo
  getIt.registerLazySingleton(() => DragonRepo(dio));
  getIt.registerLazySingleton(() => DragonRepoImpl(dragonRepo: getIt()));;

  /// dragon cubit
  getIt.registerFactory(() => DragonCubit(dragonRepo: getIt()));

}
