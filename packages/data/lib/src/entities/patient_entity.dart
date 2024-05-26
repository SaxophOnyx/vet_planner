import 'package:json_annotation/json_annotation.dart';

part 'patient_entity.g.dart';

@JsonSerializable()
class PatientEntity {
  final int id;
  final String name;

  PatientEntity({
    required this.id,
    required this.name,
  });

  factory PatientEntity.fromJson(Map<String, dynamic> json) => _$PatientEntityFromJson(json);

  Map<String, dynamic> toJson() => _$PatientEntityToJson(this);
}
