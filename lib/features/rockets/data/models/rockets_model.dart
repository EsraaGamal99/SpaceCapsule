import 'package:json_annotation/json_annotation.dart';

part 'rockets_model.g.dart';

@JsonSerializable()
class RocketsModel {

  factory RocketsModel.fromJson(Map<String, dynamic> json) =>
      _$RocketsModelFromJson(json);
  RocketsModel({
      this.height, 
      this.diameter, 
      this.mass, 
      this.firstStage, 
      this.secondStage, 
      this.engines, 
      this.landingLegs, 
      this.payloadWeights, 
      this.flickrImages, 
      this.name, 
      this.type, 
      this.active, 
      this.stages, 
      this.boosters, 
      this.costPerLaunch, 
      this.successRatePct, 
      this.firstFlight, 
      this.country, 
      this.company, 
      this.wikipedia, 
      this.description, 
      this.id,});


  Height? height;
  Diameter? diameter;
  Mass? mass;
  FirstStage? firstStage;
  SecondStage? secondStage;
  Engines? engines;
  LandingLegs? landingLegs;
  List<PayloadWeights>? payloadWeights;
  List<String>? flickrImages;
  String? name;
  String? type;
  bool? active;
  int? stages;
  int? boosters;
  int? costPerLaunch;
  int? successRatePct;
  String? firstFlight;
  String? country;
  String? company;
  String? wikipedia;
  String? description;
  String? id;


}

@JsonSerializable()
class PayloadWeights {

  PayloadWeights({
      this.id, 
      this.name, 
      this.kg, 
      this.lb,});


  String? id;
  String? name;
  int? kg;
  int? lb;

  factory PayloadWeights.fromJson(Map<String, dynamic> json) =>
      _$PayloadWeightsFromJson(json);

}

@JsonSerializable()
class LandingLegs {
  factory LandingLegs.fromJson(Map<String, dynamic> json) =>
      _$LandingLegsFromJson(json);
  LandingLegs({
      this.number, 
      this.material,});


  int? number;
  dynamic material;


}

@JsonSerializable()
class Engines {
  factory Engines.fromJson(Map<String, dynamic> json) =>
      _$EnginesFromJson(json);
  Engines({
      this.isp, 
      this.thrustSeaLevel, 
      this.thrustVacuum, 
      this.number, 
      this.type, 
      this.version, 
      this.layout, 
      this.engineLossMax, 
      this.propellant1, 
      this.propellant2, 
      this.thrustToWeight,});


  Isp? isp;
  ThrustSeaLevel? thrustSeaLevel;
  ThrustVacuum? thrustVacuum;
  int? number;
  String? type;
  String? version;
  String? layout;
  int? engineLossMax;
  String? propellant1;
  String? propellant2;
  int? thrustToWeight;


}

@JsonSerializable()
class ThrustVacuum {
  factory ThrustVacuum.fromJson(Map<String, dynamic> json) =>
      _$ThrustVacuumFromJson(json);
  ThrustVacuum({
      this.kN, 
      this.lbf,});


  int? kN;
  int? lbf;

}

@JsonSerializable()
class ThrustSeaLevel {
  factory ThrustSeaLevel.fromJson(Map<String, dynamic> json) =>
      _$ThrustSeaLevelFromJson(json);
  ThrustSeaLevel({
      this.kN, 
      this.lbf,});


  int? kN;
  int? lbf;

}

@JsonSerializable()
class Isp {
  factory Isp.fromJson(Map<String, dynamic> json) =>
      _$IspFromJson(json);
  Isp({
      this.seaLevel, 
      this.vacuum,});


  int? seaLevel;
  int? vacuum;

}

@JsonSerializable()
class SecondStage {
  factory SecondStage.fromJson(Map<String, dynamic> json) =>
      _$SecondStageFromJson(json);
  SecondStage({
      this.thrust, 
      this.payloads, 
      this.reusable, 
      this.engines, 
      this.fuelAmountTons, 
      this.burnTimeSec,});


  Thrust? thrust;
  Payloads? payloads;
  bool? reusable;
  int? engines;
  double? fuelAmountTons;
  int? burnTimeSec;


}

@JsonSerializable()
class Payloads {
  factory Payloads.fromJson(Map<String, dynamic> json) =>
      _$PayloadsFromJson(json);
  Payloads({
      this.compositeFairing, 
      this.option1,});


  CompositeFairing? compositeFairing;
  String? option1;

}

@JsonSerializable()
class CompositeFairing {
  factory CompositeFairing.fromJson(Map<String, dynamic> json) =>
      _$CompositeFairingFromJson(json);
  CompositeFairing({
      this.height, 
      this.diameter,});


  Height? height;
  Diameter? diameter;

}

@JsonSerializable()
class Diameter {
  factory Diameter.fromJson(Map<String, dynamic> json) =>
      _$DiameterFromJson(json);
  Diameter({
      this.meters, 
      this.feet,});


  double? meters;
  double? feet;

}

@JsonSerializable()
class Height {
  factory Height.fromJson(Map<String, dynamic> json) =>
      _$HeightFromJson(json);
  Height({
      this.meters, 
      this.feet,});


  double? meters;
  double? feet;

}

@JsonSerializable()
class Thrust {
  factory Thrust.fromJson(Map<String, dynamic> json) =>
      _$ThrustFromJson(json);
  Thrust({
      this.kN, 
      this.lbf,});


  int? kN;
  int? lbf;

}

@JsonSerializable()
class FirstStage {
  factory FirstStage.fromJson(Map<String, dynamic> json) =>
      _$FirstStageFromJson(json);
  FirstStage({
      this.thrustSeaLevel, 
      this.thrustVacuum, 
      this.reusable, 
      this.engines, 
      this.fuelAmountTons, 
      this.burnTimeSec,});

  ThrustSeaLevel? thrustSeaLevel;
  ThrustVacuum? thrustVacuum;
  bool? reusable;
  int? engines;
  double? fuelAmountTons;
  int? burnTimeSec;

}

@JsonSerializable()
class Mass {
  factory Mass.fromJson(Map<String, dynamic> json) =>
      _$MassFromJson(json);
  Mass({
      this.kg, 
      this.lb,});


  int? kg;
  int? lb;

}
