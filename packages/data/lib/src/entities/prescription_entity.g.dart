// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prescription_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrescriptionEntity _$PrescriptionEntityFromJson(Map<String, dynamic> json) =>
    PrescriptionEntity(
      id: (json['id'] as num).toInt(),
      patientId: (json['patientId'] as num).toInt(),
      comment: json['comment'] as String?,
    );

Map<String, dynamic> _$PrescriptionEntityToJson(PrescriptionEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'patientId': instance.patientId,
      'comment': instance.comment,
    };
