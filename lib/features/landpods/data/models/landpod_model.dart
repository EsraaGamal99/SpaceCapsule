import 'package:json_annotation/json_annotation.dart';
part 'landpod_model.g.dart';

@JsonSerializable()
class LandpodModel {
  String? name;
  String? fullName;
  @JsonKey(name: 'details')
  String? description;
  @JsonKey(name: 'images')
  ImageModel? image;
  String? type;
  String? region;
  String? locality;
  String? status;
  String? wikipedia;

  LandpodModel({
    this.name,
    this.fullName,
    this.description,
    this.image,
    this.type,
    this.region,
    this.locality,
    this.status,
    this.wikipedia,
  });

  factory LandpodModel.fromJson(Map<String, dynamic> json) => _$LandpodModelFromJson(json);
  Map<String, dynamic> toJson() => _$LandpodModelToJson(this);

}


@JsonSerializable()
class ImageModel {
  List<String>? large;
  List<String>? medium;
  List<String>? small;

  ImageModel({
    this.large,
    this.medium,
    this.small,
  });

  static fromJson(Map<String, dynamic> json) => _$ImageModelFromJson(json);
}