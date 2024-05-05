import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:space_app/core/helpers/constants.dart';
import '../../../../core/networking/error_handler_base.dart';
import '../../../../core/networking/result_handler.dart';
import '../models/rockets_model.dart';

class RocketLocalRepo  {

  final SharedPreferences sharedPreferences;
  RocketLocalRepo({required this.sharedPreferences});


  Future<void> cacheRockets(List<RocketsModel> rocketModels) async{
    List rocketsModelToJson = await rocketModels.map<Map<String, dynamic>>
      ((rocketModel) =>  rocketModel.toJson()).toList();
    sharedPreferences.setString(rocketsKey, json.encode(rocketsModelToJson));
  }


  Future<ResultHandler<List<RocketsModel>>> getCachedRockets() async {
    try {
      final jsonString = sharedPreferences.getString(rocketsKey);
      if (jsonString != null) {
        List decodeJsonData = json.decode(jsonString);
        List<RocketsModel> jsonToRocketsModels = await decodeJsonData
            .map<RocketsModel>((jsonRocketsModel) =>
            RocketsModel.fromJson(jsonRocketsModel)).toList();
        return ResultHandler.success(jsonToRocketsModels);
        //return Future.value(jsonToRocketsModels);
      } else {
        return ResultHandler.failure(ErrorHandler.handle(SharedPreferencesErrorHandler(Exception('Error Exception'))));
      }
    } catch (e) {
      print(e);
      return ResultHandler.failure(ErrorHandler.handle(SharedPreferencesErrorHandler(e)));

    }
  }
}