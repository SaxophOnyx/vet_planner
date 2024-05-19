// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prescription_entry_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrescriptionEntryEntity _$PrescriptionEntryEntityFromJson(
        Map<String, dynamic> json) =>
    PrescriptionEntryEntity(
      id: (json['id'] as num).toInt(),
      prescriptionId: (json['prescriptionId'] as num).toInt(),
      storedMedicationId: (json['storedMedicationId'] as num).toInt(),
      dosage: (json['dosage'] as num).toInt(),
      datetimeMsSinceEpoch: (json['datetimeMsSinceEpoch'] as num).toInt(),
    );

Map<String, dynamic> _$PrescriptionEntryEntityToJson(
        PrescriptionEntryEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'prescriptionId': instance.prescriptionId,
      'storedMedicationId': instance.storedMedicationId,
      'dosage': instance.dosage,
      'datetimeMsSinceEpoch': instance.datetimeMsSinceEpoch,
    };
