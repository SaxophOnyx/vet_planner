import 'package:json_annotation/json_annotation.dart';

part 'prescription_entry_entity.g.dart';

@JsonSerializable()
class PrescriptionEntryEntity {
  final int id;
  final int prescriptionId;
  final int storedMedicationId;
  final int dosage;
  final int datetimeMsSinceEpoch;

  const PrescriptionEntryEntity({
    required this.id,
    required this.prescriptionId,
    required this.storedMedicationId,
    required this.dosage,
    required this.datetimeMsSinceEpoch,
  });

  factory PrescriptionEntryEntity.fromJson(Map<String, dynamic> json) =>
      _$PrescriptionEntryEntityFromJson(json);

  Map<String, dynamic> toJson() => _$PrescriptionEntryEntityToJson(this);
}
