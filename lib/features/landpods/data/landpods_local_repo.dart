import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:space_app/core/helpers/constants.dart';
import 'package:space_app/features/landpods/data/models/landpod_model.dart';
import '../../../../core/networking/error_handler_base.dart';
import '../../../../core/networking/result_handler.dart';

class LandpodLocalRepo  {

  final SharedPreferences sharedPreferences;
  LandpodLocalRepo({required this.sharedPreferences});


  Future<void> cacheLandpods(List<LandpodModel> landpodModels) async{
    List landpodsModelToJson = await landpodModels.map<Map<String, dynamic>>
      ((landpodModel) =>  landpodModel.toJson()).toList();
    sharedPreferences.setString(landpodsKey, json.encode(landpodsModelToJson));
  }


  Future<ResultHandler<List<LandpodModel>>> getCachedLandpods(BuildContext context) async {
    try {
      final jsonString = sharedPreferences.getString(landpodsKey);
      if (jsonString != null) {
        List decodeJsonData = json.decode(jsonString);
        List<LandpodModel> jsonToLandpodsModels = await decodeJsonData
            .map<LandpodModel>((jsonLandpodsModel) =>
            LandpodModel.fromJson(jsonLandpodsModel)).toList();
        return ResultHandler.success(jsonToLandpodsModels);
        //return Future.value(jsonToLandpodsModels);
      } else {
        return ResultHandler.failure(ErrorHandler.handle(context, SharedPreferencesErrorHandler(Exception('Error Exception'))));
      }
    } catch (e) {
      print(e);
      return ResultHandler.failure(ErrorHandler.handle(context, SharedPreferencesErrorHandler(e)));

    }
  }
}