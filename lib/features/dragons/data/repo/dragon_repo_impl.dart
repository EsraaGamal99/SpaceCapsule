
import 'package:space_app/core/networking/result_handler.dart';
import 'package:space_app/features/dragons/data/models/dragon_model.dart';

import '../../../../core/networking/error_handler_base.dart';
import 'dragon_repo.dart';

class DragonRepoImpl {
  DragonRepo dragonRepo;

  DragonRepoImpl({required this.dragonRepo});

  Future<ResultHandler<List<DragonModel>>> getAllDragons() async {

    try{
      final response = await dragonRepo.getAllDragons();
      return ResultHandler.success(response);
    } catch (errro) {
      return ResultHandler.failure(Handler.handle(ApiErrorHandler(errro)));
    }

  }


}