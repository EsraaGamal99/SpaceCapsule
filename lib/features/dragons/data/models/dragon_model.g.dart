// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dragon_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DragonModel _$DragonModelFromJson(Map<String, dynamic> json) => DragonModel(
      heatShield: json['heatShield'] == null
          ? null
          : HeatShieldModel.fromJson(
              json['heatShield'] as Map<String, dynamic>),
      launchPayloadMass: json['launchPayloadMass'] == null
          ? null
          : LaunchPayloadMassModel.fromJson(
              json['launchPayloadMass'] as Map<String, dynamic>),
      launchPayloadVol: json['launchPayloadVol'] == null
          ? null
          : LaunchPayloadVolModel.fromJson(
              json['launchPayloadVol'] as Map<String, dynamic>),
      returnPayloadMass: json['returnPayloadMass'] == null
          ? null
          : LaunchPayloadMassModel.fromJson(
              json['returnPayloadMass'] as Map<String, dynamic>),
      returnPayloadVol: json['returnPayloadVol'] == null
          ? null
          : LaunchPayloadVolModel.fromJson(
              json['returnPayloadVol'] as Map<String, dynamic>),
      pressurizedCapsule: json['pressurizedCapsule'] == null
          ? null
          : PressurizedCapsuleModel.fromJson(
              json['pressurizedCapsule'] as Map<String, dynamic>),
      trunk: json['trunk'] == null
          ? null
          : TrunkModel.fromJson(json['trunk'] as Map<String, dynamic>),
      heightWTrunk: json['heightWTrunk'] == null
          ? null
          : HeightWTrunkModel.fromJson(
              json['heightWTrunk'] as Map<String, dynamic>),
      diameter: json['diameter'] == null
          ? null
          : DiameterModel.fromJson(json['diameter'] as Map<String, dynamic>),
      firstFlight: json['firstFlight'] as String?,
      flickrImages: (json['flickrImages'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      name: json['name'] as String?,
      type: json['type'] as String?,
      active: json['active'] as bool?,
      crewCapacity: (json['crewCapacity'] as num?)?.toInt(),
      sidewallAngleDeg: (json['sidewallAngleDeg'] as num?)?.toInt(),
      orbitDurationYr: (json['orbitDurationYr'] as num?)?.toInt(),
      dryMassKg: (json['dryMassKg'] as num?)?.toInt(),
      dryMassLb: (json['dryMassLb'] as num?)?.toInt(),
      thrusters: (json['thrusters'] as List<dynamic>?)
          ?.map((e) => ThrustersModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      wikipedia: json['wikipedia'] as String?,
      description: json['description'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$DragonModelToJson(DragonModel instance) =>
    <String, dynamic>{
      'heatShield': instance.heatShield,
      'launchPayloadMass': instance.launchPayloadMass,
      'launchPayloadVol': instance.launchPayloadVol,
      'returnPayloadMass': instance.returnPayloadMass,
      'returnPayloadVol': instance.returnPayloadVol,
      'pressurizedCapsule': instance.pressurizedCapsule,
      'trunk': instance.trunk,
      'heightWTrunk': instance.heightWTrunk,
      'diameter': instance.diameter,
      'firstFlight': instance.firstFlight,
      'flickrImages': instance.flickrImages,
      'name': instance.name,
      'type': instance.type,
      'active': instance.active,
      'crewCapacity': instance.crewCapacity,
      'sidewallAngleDeg': instance.sidewallAngleDeg,
      'orbitDurationYr': instance.orbitDurationYr,
      'dryMassKg': instance.dryMassKg,
      'dryMassLb': instance.dryMassLb,
      'thrusters': instance.thrusters,
      'wikipedia': instance.wikipedia,
      'description': instance.description,
      'id': instance.id,
    };

HeatShieldModel _$HeatShieldModelFromJson(Map<String, dynamic> json) =>
    HeatShieldModel(
      material: json['material'] as String?,
      sizeMeters: (json['sizeMeters'] as num?)?.toDouble(),
      tempDegrees: (json['tempDegrees'] as num?)?.toInt(),
      devPartner: json['devPartner'] as String?,
    );

Map<String, dynamic> _$HeatShieldModelToJson(HeatShieldModel instance) =>
    <String, dynamic>{
      'material': instance.material,
      'sizeMeters': instance.sizeMeters,
      'tempDegrees': instance.tempDegrees,
      'devPartner': instance.devPartner,
    };

LaunchPayloadMassModel _$LaunchPayloadMassModelFromJson(
        Map<String, dynamic> json) =>
    LaunchPayloadMassModel(
      kg: (json['kg'] as num?)?.toInt(),
      lb: (json['lb'] as num?)?.toInt(),
    );

Map<String, dynamic> _$LaunchPayloadMassModelToJson(
        LaunchPayloadMassModel instance) =>
    <String, dynamic>{
      'kg': instance.kg,
      'lb': instance.lb,
    };

LaunchPayloadVolModel _$LaunchPayloadVolModelFromJson(
        Map<String, dynamic> json) =>
    LaunchPayloadVolModel(
      cubicMeters: (json['cubicMeters'] as num?)?.toInt(),
      cubicFeet: (json['cubicFeet'] as num?)?.toInt(),
    );

Map<String, dynamic> _$LaunchPayloadVolModelToJson(
        LaunchPayloadVolModel instance) =>
    <String, dynamic>{
      'cubicMeters': instance.cubicMeters,
      'cubicFeet': instance.cubicFeet,
    };

PressurizedCapsuleModel _$PressurizedCapsuleModelFromJson(
        Map<String, dynamic> json) =>
    PressurizedCapsuleModel(
      payloadVolume: json['payloadVolume'] == null
          ? null
          : LaunchPayloadVolModel.fromJson(
              json['payloadVolume'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PressurizedCapsuleModelToJson(
        PressurizedCapsuleModel instance) =>
    <String, dynamic>{
      'payloadVolume': instance.payloadVolume,
    };

TrunkModel _$TrunkModelFromJson(Map<String, dynamic> json) => TrunkModel(
      trunkVolume: json['trunkVolume'] == null
          ? null
          : LaunchPayloadVolModel.fromJson(
              json['trunkVolume'] as Map<String, dynamic>),
      cargo: json['cargo'] == null
          ? null
          : CargoModel.fromJson(json['cargo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TrunkModelToJson(TrunkModel instance) =>
    <String, dynamic>{
      'trunkVolume': instance.trunkVolume,
      'cargo': instance.cargo,
    };

CargoModel _$CargoModelFromJson(Map<String, dynamic> json) => CargoModel(
      solarArray: (json['solarArray'] as num?)?.toInt(),
      unpressurizedCargo: json['unpressurizedCargo'] as bool?,
    );

Map<String, dynamic> _$CargoModelToJson(CargoModel instance) =>
    <String, dynamic>{
      'solarArray': instance.solarArray,
      'unpressurizedCargo': instance.unpressurizedCargo,
    };

HeightWTrunkModel _$HeightWTrunkModelFromJson(Map<String, dynamic> json) =>
    HeightWTrunkModel(
      meters: (json['meters'] as num?)?.toDouble(),
      feet: (json['feet'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$HeightWTrunkModelToJson(HeightWTrunkModel instance) =>
    <String, dynamic>{
      'meters': instance.meters,
      'feet': instance.feet,
    };

DiameterModel _$DiameterModelFromJson(Map<String, dynamic> json) =>
    DiameterModel(
      meters: (json['meters'] as num?)?.toDouble(),
      feet: (json['feet'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DiameterModelToJson(DiameterModel instance) =>
    <String, dynamic>{
      'meters': instance.meters,
      'feet': instance.feet,
    };

ThrustersModel _$ThrustersModelFromJson(Map<String, dynamic> json) =>
    ThrustersModel(
      type: json['type'] as String?,
      amount: (json['amount'] as num?)?.toInt(),
      pods: (json['pods'] as num?)?.toInt(),
      fuel1: json['fuel1'] as String?,
      fuel2: json['fuel2'] as String?,
      isp: (json['isp'] as num?)?.toInt(),
      thrust: json['thrust'] == null
          ? null
          : ThrustModel.fromJson(json['thrust'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ThrustersModelToJson(ThrustersModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'amount': instance.amount,
      'pods': instance.pods,
      'fuel1': instance.fuel1,
      'fuel2': instance.fuel2,
      'isp': instance.isp,
      'thrust': instance.thrust,
    };

ThrustModel _$ThrustModelFromJson(Map<String, dynamic> json) => ThrustModel(
      kN: (json['kN'] as num?)?.toDouble(),
      lbf: (json['lbf'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ThrustModelToJson(ThrustModel instance) =>
    <String, dynamic>{
      'kN': instance.kN,
      'lbf': instance.lbf,
    };
