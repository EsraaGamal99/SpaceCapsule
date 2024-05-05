


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_app/features/dragons/data/models/dragon_model.dart';
import 'package:space_app/features/dragons/data/repo/dragon_local_repo.dart';
import 'package:space_app/features/dragons/data/repo/dragon_repo_impl.dart';

import '../../../core/networking/internet_checker.dart';
import 'dragon_state.dart';

class DragonCubit extends Cubit<DragonState> {
  DragonRepoImpl dragonRepo;
  final DragonLocalRepo dragonLocalRepo;
  final InternetCheckerImpl internetChecker;
  DragonCubit({required this.dragonRepo, required this.dragonLocalRepo , required this.internetChecker})
      : super(const DragonState.initial());

  static DragonCubit get(context) => BlocProvider.of<DragonCubit>(context);

  static List<DragonModel> dragons = [];

  emitGetAllDragonsStates() async {
    emit(const DragonState.loading());
    final response = await dragonRepo.getAllDragons();
    response.when(
        success: (response) {
          print(response.toList().toString());
          emit(DragonState.success(response));
          dragons = response;
        }, failure: (error) {
      emit(DragonState.error(error: error.errorModel.message ?? ''));
    });
  }

  void emitCachedDragonsStates() async{
    emit(const DragonState.loading());
    final response = await dragonLocalRepo.getCachedDragons();
    response.when(
        success: (response) {
          emit(DragonState.success(response));
          dragons = response;
          //dragonLocalRepo.cacheDragons(response);
        }, failure: (error) {
      emit(DragonState.error(error: error.errorModel.message ?? ''));
    });
  }

  void getDragons() async{
    if(await internetChecker.isConnected){
      emitGetAllDragonsStates();
    }else {
      emitCachedDragonsStates();
    }
  }

}