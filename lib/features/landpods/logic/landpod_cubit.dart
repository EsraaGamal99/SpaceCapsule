import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:space_app/features/landpods/data/landpod_repo_impl.dart';
import 'package:space_app/features/landpods/logic/landpod_state.dart';

import '../../../core/networking/internet_checker.dart';
import '../data/landpods_local_repo.dart';

class LandpodCubit extends Cubit<LandpodState> {
  LandpodCubit({required this.landpodRepo, required this.landpodLocalRepo, required this.internetChecker}) : super(const LandpodState.initial());

  final LandpodRepoImpl landpodRepo;
  final LandpodLocalRepo landpodLocalRepo;
  final InternetCheckerImpl internetChecker;

  void fetchLandpods(BuildContext context) async {
    emit(const LandpodState.loading());
    final landpods = await landpodRepo.getAllLandpods(context);

    landpods.when(success: (landpods) {
      emit(LandpodState.loaded(landpods));
    }, failure: (error) {
      emit(LandpodState.error(error.errorModel.message ?? ''));
    });
  }

  void emitCachedLandpodStates(BuildContext context) async{
    emit(const LandpodState.loading());
    final response = await landpodLocalRepo.getCachedLandpods(context);
    response.when(
        success: (response) {
          emit(LandpodState.loaded(response));
        }, failure: (error) {
      emit(LandpodState.error(error.errorModel.message ?? ''));
    });
  }

  void getLandpods(BuildContext context) async{
    if(await internetChecker.isConnected){
      fetchLandpods(context);
    }else {
      emitCachedLandpodStates(context);
    }
  }
}
