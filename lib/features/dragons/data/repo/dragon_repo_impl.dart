
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:space_app/core/networking/api_service/api_service.dart';
import 'package:space_app/core/networking/result_handler.dart';
import 'package:space_app/features/dragons/data/models/dragon_model.dart';

import '../../../../core/networking/error_handler_base.dart';



class DragonRepoImpl {
  final ApiService apiService;

  DragonRepoImpl({required this.apiService});

  Future<ResultHandler<List<DragonModel>>> getAllDragons(BuildContext context) async {
    try{
      final response = await apiService.getAllDragons();
      return ResultHandler.success(response);
    } catch (errro) {
      return ResultHandler.failure(ErrorHandler.handle(context, ApiErrorHandler(errro)));
    }

  }


}