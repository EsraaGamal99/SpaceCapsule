import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_app/features/rockets/data/models/rockets_model.dart';
import 'package:space_app/features/rockets/data/repo/rockets_repo_impl.dart';
import 'package:space_app/features/rockets/logic/rockets_cubit/rockets_state.dart';

import '../../../../core/networking/internet_checker.dart';
import '../../data/repo/rockets_local_repo.dart';


class RocketsCubit extends Cubit<RocketsState> {
  final RocketsRepoImpl rocketsRepo;
  final RocketLocalRepo rocketLocalRepo;
  final InternetCheckerImpl internetChecker;
  static List<RocketsModel> rockets = [];

  static RocketsCubit get(context) => BlocProvider.of(context);

  RocketsCubit({
    required this.rocketsRepo,
    required this.internetChecker,
    required this.rocketLocalRepo
  }) : super(const RocketsState.initial());

  void emitGetAllRocketsStates(BuildContext context) async {
    emit(const RocketsState.loading());
    final response = await rocketsRepo.getAllRockets(context);
    response.when(success: (response) {
      rockets = response;
      debugPrint('--------------------------------- ${rockets[0].name}');
      emit(RocketsState.success(response));
    }, failure: (error) {
      emit(RocketsState.error(error: error.errorModel.message ?? ''));
    });
  }

  void emitCachedRocketsStates(BuildContext context) async{
    emit(const RocketsState.loading());
    final response = await rocketLocalRepo.getCachedRockets(context);
    response.when(
        success: (response) {
          emit(RocketsState.success(response));
          rockets = response;
          //rocketLocalRepo.cacheRockets(response);
        }, failure: (error) {
      emit(RocketsState.error(error: error.errorModel.message ?? ''));
    });
  }

  void getRockets(BuildContext context) async{
    if(await internetChecker.isConnected){
      emitGetAllRocketsStates(context);
    }else {
      emitCachedRocketsStates(context);
    }
  }
}
