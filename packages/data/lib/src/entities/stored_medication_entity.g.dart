// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stored_medication_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoredMedicationEntity _$StoredMedicationEntityFromJson(
        Map<String, dynamic> json) =>
    StoredMedicationEntity(
      id: (json['id'] as num).toInt(),
      medicationId: (json['medicationId'] as num).toInt(),
      initialQuantity: (json['initialQuantity'] as num).toInt(),
      freeQuantity: (json['freeQuantity'] as num).toInt(),
      reservedQuantity: (json['reservedQuantity'] as num).toInt(),
      expirationDateMsSinceEpoch:
          (json['expirationDateMsSinceEpoch'] as num).toInt(),
      manualTitle: json['manualTitle'] as String?,
    );

Map<String, dynamic> _$StoredMedicationEntityToJson(
        StoredMedicationEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'medicationId': instance.medicationId,
      'initialQuantity': instance.initialQuantity,
      'freeQuantity': instance.freeQuantity,
      'reservedQuantity': instance.reservedQuantity,
      'expirationDateMsSinceEpoch': instance.expirationDateMsSinceEpoch,
      'manualTitle': instance.manualTitle,
    };
