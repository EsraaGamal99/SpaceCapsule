// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dragon_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DragonModel _$DragonModelFromJson(Map<String, dynamic> json) => DragonModel(
      flickrImages: (json['flickr_images'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      name: json['name'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$DragonModelToJson(DragonModel instance) =>
    <String, dynamic>{
      'flickr_images': instance.flickrImages,
      'name': instance.name,
      'description': instance.description,
    };
