// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rockets_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RocketsModel _$RocketsModelFromJson(Map<String, dynamic> json) => RocketsModel(
      flickrImages: (json['flickr_images'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      name: json['name'] as String?,
      wikipedia: json['wikipedia'] as String?,
      description: json['description'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$RocketsModelToJson(RocketsModel instance) =>
    <String, dynamic>{
      'flickr_images': instance.flickrImages,
      'name': instance.name,
      'wikipedia': instance.wikipedia,
      'description': instance.description,
      'id': instance.id,
    };
