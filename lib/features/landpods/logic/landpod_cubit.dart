import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:space_app/features/landpods/data/landpod_repo_impl.dart';
import 'package:space_app/features/landpods/logic/landpod_state.dart';

class LandpodCubit extends Cubit<LandpodState> {
  LandpodCubit({required this.landpodRepo}) : super(const LandpodState.initial());

  final LandpodRepoImpl landpodRepo;

  void fetchLandpods() async {
    emit(const LandpodState.loading());
    final landpods = await landpodRepo.getAllLandpods();

    landpods.when(success: (landpods) {
      emit(LandpodState.loaded(landpods));
    }, failure: (error) {
      emit(LandpodState.error(error.errorModel.message ?? ''));
    });
  }
}
