import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_app/features/rockets/data/models/rockets_model.dart';
import 'package:space_app/features/rockets/data/repo/rockets_repo.dart';
import 'package:space_app/features/rockets/data/repo/rockets_repo_impl.dart';
import 'package:space_app/features/rockets/logic/rockets_cubit/rockets_state.dart';

import '../../../dragons/data/models/dragon_model.dart';
import '../../../dragons/data/repo/dragon_repo_impl.dart';
import '../../../dragons/logic/dragon_cubit.dart';
import '../../../dragons/logic/dragon_state.dart';

class RocketsCubit extends Cubit<RocketsState> {
  final RocketsRepoImpl rocketsRepo;
  static List<RocketsModel> rockets = [];

  static RocketsCubit get(context) => BlocProvider.of<RocketsCubit>(context);

  RocketsCubit({
    required this.rocketsRepo,
  }) : super(const RocketsState.initial());

  void emitGetAllRocketsStates() async {
    emit(const RocketsState.loading());
    final response = await rocketsRepo.getAllRockets();
    response.when(success: (response) {
      rockets = response;
      emit(RocketsState.success(response));
    }, failure: (error) {
      emit(RocketsState.error(error: error.errorModel.message ?? ''));
    });
  }
}