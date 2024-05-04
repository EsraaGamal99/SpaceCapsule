import 'package:flutter/foundation.dart';
import 'package:space_app/core/networking/api_service/api_service.dart';
import 'package:space_app/core/networking/error_handler_base.dart';
import 'package:space_app/core/networking/result_handler.dart';
import 'package:space_app/features/rockets/data/models/rockets_model.dart';

class RocketsRepoImpl {

  final ApiService apiService;

  RocketsRepoImpl({required this.apiService});

  Future<ResultHandler<List<RocketsModel>>> getAllRockets() async {
    try {
      final response = await apiService.getAllRockets();
      debugPrint('00000000000000000000000000000000000000000000000000');
      return ResultHandler.success(response);
    } catch (error) {
      debugPrint('***************************************************');
      return ResultHandler.failure(ErrorHandler.handle(ApiErrorHandler(error)));
    }
  }
}

