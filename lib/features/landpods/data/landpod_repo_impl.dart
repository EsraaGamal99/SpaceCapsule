import 'package:flutter/material.dart';
import 'package:space_app/core/networking/api_service/api_service.dart';
import 'package:space_app/core/networking/result_handler.dart';
import 'package:space_app/features/landpods/data/models/landpod_model.dart';
import '../../../../core/networking/error_handler_base.dart';


class LandpodRepoImpl {
  final ApiService apiService;

  LandpodRepoImpl({required this.apiService});

  Future<ResultHandler<List<LandpodModel>>> getAllLandpods() async {
    try{
      final response = await apiService.getAllLandpods();
      return ResultHandler.success(response);
    } catch (error) {
      return ResultHandler.failure(ErrorHandler.handle(ApiErrorHandler(error)));
    }
  }
}