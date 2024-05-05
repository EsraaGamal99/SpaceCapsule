
import 'package:freezed_annotation/freezed_annotation.dart';
part 'dragon_model.g.dart';

@JsonSerializable()
class DragonModel {
  @JsonKey(name: 'flickr_images')
  List<String>? flickrImages;
  String? name;
  String? description;

  DragonModel(
      {
        this.flickrImages,
        this.name,
        this.description,
        });

  factory DragonModel.fromJson(Map<String, dynamic> json) =>
      _$DragonModelFromJson(json);
  Map<String, dynamic> toJson() => _$DragonModelToJson(this);
}
