import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_app/features/rockets/data/models/rockets_model.dart';
import 'package:space_app/features/rockets/data/repo/rockets_repo_impl.dart';
import 'package:space_app/features/rockets/logic/rockets_cubit/rockets_state.dart';


class RocketsCubit extends Cubit<RocketsState> {
  final RocketsRepoImpl rocketsRepo;
  static List<RocketsModel> rockets = [];

  static RocketsCubit get(context) => BlocProvider.of(context);

  RocketsCubit({
    required this.rocketsRepo,
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
}
