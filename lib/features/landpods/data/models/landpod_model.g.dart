// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'landpod_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LandpodModel _$LandpodModelFromJson(Map<String, dynamic> json) => LandpodModel(
      name: json['name'] as String?,
      fullName: json['full_name'] as String?,
      description: json['details'] as String?,
      image: json['images'] == null
          ? null
          : ImageModel.fromJson(json['images'] as Map<String, dynamic>),
      type: json['type'] as String?,
      region: json['region'] as String?,
      locality: json['locality'] as String?,
      status: json['status'] as String?,
      wikipedia: json['wikipedia'] as String?,
    );

Map<String, dynamic> _$LandpodModelToJson(LandpodModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'full_name': instance.fullName,
      'details': instance.description,
      'images': instance.image,
      'type': instance.type,
      'region': instance.region,
      'locality': instance.locality,
      'status': instance.status,
      'wikipedia': instance.wikipedia,
    };

ImageModel _$ImageModelFromJson(Map<String, dynamic> json) => ImageModel(
      large:
          (json['large'] as List<dynamic>?)?.map((e) => e as String).toList(),
      medium:
          (json['medium'] as List<dynamic>?)?.map((e) => e as String).toList(),
      small:
          (json['small'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ImageModelToJson(ImageModel instance) =>
    <String, dynamic>{
      'large': instance.large,
      'medium': instance.medium,
      'small': instance.small,
    };
