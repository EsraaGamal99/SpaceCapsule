import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:space_app/core/networking/api_service/api_constants.dart';
import 'package:space_app/features/dragons/data/models/dragon_model.dart';

part 'dragon_repo.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class DragonRepo {
  factory DragonRepo(Dio dio, {String baseUrl}) = _DragonRepo;

  @GET(ApiConstants.dragons)
  Future<List<DragonModel>> getAllDragons();
}
