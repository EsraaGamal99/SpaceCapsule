import 'package:flutter/foundation.dart';
import 'package:space_app/core/networking/error_handler_base.dart';
import 'package:space_app/core/networking/result_handler.dart';
import 'package:space_app/features/rockets/data/models/rockets_model.dart';
import 'package:space_app/features/rockets/data/repo/rockets_repo.dart';

class RocketsRepoImpl {

  RocketsRepo rocketsRepo;
  RocketsRepoImpl({required this.rocketsRepo});

  Future<ResultHandler<List<RocketsModel>>> getAllRockets() async {
    try {
      final response = await rocketsRepo.getAllRockets();
      debugPrint('00000000000000000000000000000000000000000000000000');
      return ResultHandler.success(response);
    } catch (error) {
      debugPrint('***************************************************');
      return ResultHandler.failure(ErrorHandler.handle(ApiErrorHandler(error)));
    }
  }
}

