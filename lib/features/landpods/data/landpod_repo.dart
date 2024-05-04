import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:space_app/core/networking/api_service/api_constants.dart';
import 'package:space_app/features/landpods/data/models/landpod_model.dart';

part 'landpod_repo.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class LandpodRepo {
  factory LandpodRepo(Dio dio, {String baseUrl}) = _LandpodRepo;

  @GET(ApiConstants.landpads)
  Future<List<LandpodModel>> getAllLandpods();
}