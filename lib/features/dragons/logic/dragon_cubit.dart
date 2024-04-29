


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_app/features/dragons/data/models/dragon_model.dart';
import 'package:space_app/features/dragons/data/repo/dragon_repo_impl.dart';

import 'dragon_state.dart';

class DragonCubit extends Cubit<DragonState> {
  DragonCubit({required this.dragonRepo, })
      : super(const DragonState.initial());

  DragonRepoImpl dragonRepo;

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

}