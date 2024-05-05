import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:space_app/core/helpers/constants.dart';
import '../../../../core/networking/error_handler_base.dart';
import '../../../../core/networking/result_handler.dart';
import '../models/dragon_model.dart';

class DragonLocalRepo  {

  final SharedPreferences sharedPreferences;
  DragonLocalRepo({required this.sharedPreferences});


  Future<void> cacheDragons(List<DragonModel> dragonModels) async{
    List dragonsModelToJson = await dragonModels.map<Map<String, dynamic>>
      ((dragonModel) =>  dragonModel.toJson()).toList();
    sharedPreferences.setString(dragonsKey, json.encode(dragonsModelToJson));
  }


  Future<ResultHandler<List<DragonModel>>> getCachedDragons(BuildContext context) async {
    try {
      final jsonString = sharedPreferences.getString(dragonsKey);
      if (jsonString != null) {
        List decodeJsonData = json.decode(jsonString);
        List<DragonModel> jsonToDragonModels = await decodeJsonData
            .map<DragonModel>((jsonDragonModel) =>
            DragonModel.fromJson(jsonDragonModel)).toList();
        return ResultHandler.success(jsonToDragonModels);
        //return Future.value(jsonToDragonModels);
      } else {
        return ResultHandler.failure(ErrorHandler.handle(context, SharedPreferencesErrorHandler(Exception('Error Exception'))));
      }
    } catch (e) {
      print(e);
      return ResultHandler.failure(ErrorHandler.handle(context, SharedPreferencesErrorHandler(e)));

    }
  }
}