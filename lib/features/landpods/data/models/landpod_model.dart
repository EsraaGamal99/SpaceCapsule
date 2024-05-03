import 'package:json_annotation/json_annotation.dart';
part 'landpod_model.g.dart';

@JsonSerializable()
class LandpodModel {
  final String name;
  final String fullName;
  @JsonKey(name: 'details')
  final String description;
  @JsonKey(name: 'images')
  final ImageModel image;
  final String type;
  final String region;
  final String locality;
  final String status;
  final String wikipedia;

  LandpodModel({
    required this.name,
    required this.fullName,
    required this.description,
    required this.image,
    required this.type,
    required this.region,
    required this.locality,
    required this.status,
    required this.wikipedia,
  });

  factory LandpodModel.fromJson(Map<String, dynamic> json) => _$LandpodModelFromJson(json);

}


@JsonSerializable()
class ImageModel {
  final List<String> large;
  final List<String> medium;
  final List<String> small;

  ImageModel({
    required this.large,
    required this.medium,
    required this.small,
  });

  static fromJson(Map<String, dynamic> json) => _$ImageModelFromJson(json);
}