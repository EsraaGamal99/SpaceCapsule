import 'package:flutter/foundation.dart';
import 'package:space_app/core/networking/api_service/api_service.dart';
import 'package:space_app/core/networking/error_handler_base.dart';
import 'package:space_app/core/networking/result_handler.dart';
import 'package:space_app/features/rockets/data/models/rockets_model.dart';
import 'package:retrofit/retrofit.dart';


class RocketsRepoImpl {

  final ApiService apiService;

  RocketsRepoImpl({required this.apiService});

  Future<ResultHandler<List<RocketsModel>>> getAllRockets() async {
    try {
      final response = await apiService.getAllRockets();
      return ResultHandler.success(response);
    } catch (error) {
      return ResultHandler.failure(ErrorHandler.handle(ApiErrorHandler(error)));
    }
  }

  Future<ResultHandler<RocketsModel>> getRocket(@Path("rocketId") String rocketId) async {
    try {
      final response = await apiService.getRocket(rocketId);
      return ResultHandler.success(response);
    } catch (error) {
      return ResultHandler.failure(ErrorHandler.handle(ApiErrorHandler(error)));
    }
  }
}

