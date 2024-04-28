import 'package:json_annotation/json_annotation.dart';

part 'stored_medication_entity.g.dart';

@JsonSerializable()
class StoredMedicationEntity {
  final int id;
  final int medicationId;
  final int initialQuantity;
  final int freeQuantity;
  final int reservedQuantity;
  final int expirationDateMsSinceEpoch;
  final String? manualTitle;

  const StoredMedicationEntity({
    required this.id,
    required this.medicationId,
    required this.initialQuantity,
    required this.freeQuantity,
    required this.reservedQuantity,
    required this.expirationDateMsSinceEpoch,
    required this.manualTitle,
  });

  factory StoredMedicationEntity.fromJson(Map<String, dynamic> json) => _$StoredMedicationEntityFromJson(json);

  Map<String, dynamic> toJson() => _$StoredMedicationEntityToJson(this);
}
