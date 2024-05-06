import 'package:json_annotation/json_annotation.dart';

part 'rockets_model.g.dart';

@JsonSerializable()
class RocketsModel {

  @JsonKey(name: 'flickr_images')
  List<String>? flickrImages;
  String? name;
  String? wikipedia;
  String? description;
  String? id;

  RocketsModel({
    this.flickrImages,
    this.name,
    this.wikipedia,
    this.description,
    this.id,});

  factory RocketsModel.fromJson(Map<String, dynamic> json) =>
      _$RocketsModelFromJson(json);
  Map<String, dynamic> toJson() => _$RocketsModelToJson(this);


}
