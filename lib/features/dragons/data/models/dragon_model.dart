
import 'package:freezed_annotation/freezed_annotation.dart';
part 'dragon_model.g.dart';

@JsonSerializable()
class DragonModel {
  HeatShieldModel? heatShield;
  LaunchPayloadMassModel? launchPayloadMass;
  LaunchPayloadVolModel? launchPayloadVol;
  LaunchPayloadMassModel? returnPayloadMass;
  LaunchPayloadVolModel? returnPayloadVol;
  PressurizedCapsuleModel? pressurizedCapsule;
  TrunkModel? trunk;
  HeightWTrunkModel? heightWTrunk;
  DiameterModel? diameter;
  String? firstFlight;
  List<String>? flickrImages;
  String? name;
  String? type;
  bool? active;
  int? crewCapacity;
  int? sidewallAngleDeg;
  int? orbitDurationYr;
  int? dryMassKg;
  int? dryMassLb;
  List<ThrustersModel>? thrusters;
  String? wikipedia;
  String? description;
  String? id;

  DragonModel(
      {this.heatShield,
        this.launchPayloadMass,
        this.launchPayloadVol,
        this.returnPayloadMass,
        this.returnPayloadVol,
        this.pressurizedCapsule,
        this.trunk,
        this.heightWTrunk,
        this.diameter,
        this.firstFlight,
        this.flickrImages,
        this.name,
        this.type,
        this.active,
        this.crewCapacity,
        this.sidewallAngleDeg,
        this.orbitDurationYr,
        this.dryMassKg,
        this.dryMassLb,
        this.thrusters,
        this.wikipedia,
        this.description,
        this.id});

  factory DragonModel.fromJson(Map<String, dynamic> json) =>
      _$DragonModelFromJson(json);
  Map<String, dynamic> toJson() => _$DragonModelToJson(this);
}

@JsonSerializable()
class HeatShieldModel {
  String? material;
  double? sizeMeters;
  int? tempDegrees;
  String? devPartner;

  HeatShieldModel(
      {this.material, this.sizeMeters, this.tempDegrees, this.devPartner});


  factory HeatShieldModel.fromJson(Map<String, dynamic> json) =>
      _$HeatShieldModelFromJson(json);
  Map<String, dynamic> toJson() => _$HeatShieldModelToJson(this);
}

@JsonSerializable()
class LaunchPayloadMassModel {
  int? kg;
  int? lb;

  LaunchPayloadMassModel({this.kg, this.lb});

  factory LaunchPayloadMassModel.fromJson(Map<String, dynamic> json) =>
      _$LaunchPayloadMassModelFromJson(json);
  Map<String, dynamic> toJson() => _$LaunchPayloadMassModelToJson(this);
}

@JsonSerializable()
class LaunchPayloadVolModel {
  final int? cubicMeters;
  final int? cubicFeet;

  LaunchPayloadVolModel({this.cubicMeters, this.cubicFeet});

  factory LaunchPayloadVolModel.fromJson(Map<String, dynamic> json) =>
      _$LaunchPayloadVolModelFromJson(json);
  Map<String, dynamic> toJson() => _$LaunchPayloadVolModelToJson(this);
}

@JsonSerializable()
class PressurizedCapsuleModel {
  LaunchPayloadVolModel? payloadVolume;

  PressurizedCapsuleModel({this.payloadVolume});

  factory PressurizedCapsuleModel.fromJson(Map<String, dynamic> json) =>
      _$PressurizedCapsuleModelFromJson(json);
  Map<String, dynamic> toJson() => _$PressurizedCapsuleModelToJson(this);
}

@JsonSerializable()
class TrunkModel {
  LaunchPayloadVolModel? trunkVolume;
  CargoModel? cargo;

  TrunkModel({this.trunkVolume, this.cargo});

  factory TrunkModel.fromJson(Map<String, dynamic> json) =>
      _$TrunkModelFromJson(json);
  Map<String, dynamic> toJson() => _$TrunkModelToJson(this);
}

@JsonSerializable()
class CargoModel {
  int? solarArray;
  bool? unpressurizedCargo;

  CargoModel({this.solarArray, this.unpressurizedCargo});

  factory CargoModel.fromJson(Map<String, dynamic> json) =>
      _$CargoModelFromJson(json);
  Map<String, dynamic> toJson() => _$CargoModelToJson(this);
}

@JsonSerializable()
class HeightWTrunkModel {
  double? meters;
  double? feet;

  HeightWTrunkModel({this.meters, this.feet});

  factory HeightWTrunkModel.fromJson(Map<String, dynamic> json) =>
      _$HeightWTrunkModelFromJson(json);
  Map<String, dynamic> toJson() => _$HeightWTrunkModelToJson(this);
}

@JsonSerializable()
class DiameterModel {
  double? meters;
  int? feet;

  DiameterModel({this.meters, this.feet});

  factory DiameterModel.fromJson(Map<String, dynamic> json) =>
      _$DiameterModelFromJson(json);
  Map<String, dynamic> toJson() => _$DiameterModelToJson(this);
}

@JsonSerializable()
class ThrustersModel {
  String? type;
  int? amount;
  int? pods;
  String? fuel1;
  String? fuel2;
  int? isp;
  ThrustModel? thrust;

  ThrustersModel(
      {this.type,
        this.amount,
        this.pods,
        this.fuel1,
        this.fuel2,
        this.isp,
        this.thrust});

  factory ThrustersModel.fromJson(Map<String, dynamic> json) =>
      _$ThrustersModelFromJson(json);
  Map<String, dynamic> toJson() => _$ThrustersModelToJson(this);
}

@JsonSerializable()
class ThrustModel {
  double? kN;
  int? lbf;

  ThrustModel({this.kN, this.lbf});

  factory ThrustModel.fromJson(Map<String, dynamic> json) =>
      _$ThrustModelFromJson(json);
  Map<String, dynamic> toJson() => _$ThrustModelToJson(this);
}