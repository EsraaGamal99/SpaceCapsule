import 'package:space_app/core/networking/result_handler.dart';
import 'package:space_app/features/landpods/data/models/landpod_model.dart';

import '../../../../core/networking/error_handler_base.dart';
import 'landpod_repo.dart';

class LandpodRepoImpl {
  LandpodRepo landpodRepo;

  LandpodRepoImpl({required this.landpodRepo});

  Future<ResultHandler<List<LandpodModel>>> getAllLandpods() async {
    try{
      final response = await landpodRepo.getAllLandpods();
      return ResultHandler.success(response);
    } catch (error) {
      return ResultHandler.failure(ErrorHandler.handle(ApiErrorHandler(error)));
    }
  }
}