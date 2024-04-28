// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medication_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicationEntity _$MedicationEntityFromJson(Map<String, dynamic> json) =>
    MedicationEntity(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      medicationTypeId: (json['medicationTypeId'] as num).toInt(),
      concentrationPerUnit: (json['concentrationPerUnit'] as num).toInt(),
    );

Map<String, dynamic> _$MedicationEntityToJson(MedicationEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'medicationTypeId': instance.medicationTypeId,
      'concentrationPerUnit': instance.concentrationPerUnit,
    };
