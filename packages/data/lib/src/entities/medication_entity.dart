import 'package:json_annotation/json_annotation.dart';

part 'medication_entity.g.dart';

@JsonSerializable()
class MedicationEntity {
  final int id;
  final String name;
  final int medicationTypeId;
  final int concentrationPerUnit;

  const MedicationEntity({
    required this.id,
    required this.name,
    required this.medicationTypeId,
    required this.concentrationPerUnit,
  });

  factory MedicationEntity.fromJson(Map<String, dynamic> json) => _$MedicationEntityFromJson(json);

  Map<String, dynamic> toJson() => _$MedicationEntityToJson(this);
}
