import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_app/features/rockets/data/models/rockets_model.dart';
import 'package:space_app/features/rockets/data/repo/rockets_repo_impl.dart';

import 'one_rocket_state.dart';


class OneRocketCubit extends Cubit<OneRocketState> {
  final RocketsRepoImpl rocketsRepo;
  static RocketsModel? rocket;

  static OneRocketCubit get(context) => BlocProvider.of(context);

  OneRocketCubit({
    required this.rocketsRepo,
  }) : super(const OneRocketState.initial());

  void emitGetRocketByIDStates({required String rocketId}) async {
    emit(const OneRocketState.loading());
    final response = await rocketsRepo.getRocket(rocketId);
    response.when(success: (response) {
      rocket = response;
      debugPrint('--------------------------------- ${rocket!.name}');
      emit(OneRocketState.success(response));
    }, failure: (error) {
      emit(OneRocketState.error(error: error.errorModel.message ?? ''));
    });
  }
}
