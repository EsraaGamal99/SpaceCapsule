import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:space_app/core/networking/api_service/api_constants.dart';
import 'package:space_app/features/rockets/data/models/rockets_model.dart';

part 'rockets_repo.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class RocketsRepo {
  factory RocketsRepo(Dio dio, {String baseUrl}) = _RocketsRepo;

  @GET(ApiConstants.dragons)
  Future<List<RocketsModel>> getAllRockets();
}
