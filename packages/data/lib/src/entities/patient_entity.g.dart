// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatientEntity _$PatientEntityFromJson(Map<String, dynamic> json) =>
    PatientEntity(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$PatientEntityToJson(PatientEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
