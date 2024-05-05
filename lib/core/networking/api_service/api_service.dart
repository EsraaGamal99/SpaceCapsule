import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:space_app/core/networking/api_service/api_constants.dart';
import 'package:space_app/features/dragons/data/models/dragon_model.dart';
import 'package:space_app/features/landpods/data/models/landpod_model.dart';
import 'package:space_app/features/rockets/data/models/rockets_model.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;


  @GET(ApiConstants.rockets)
  Future<List<RocketsModel>> getAllRockets();

  @GET(ApiConstants.dragons)
  Future<List<DragonModel>> getAllDragons();

  @GET(ApiConstants.landpads)
  Future<List<LandpodModel>> getAllLandpods();
}
