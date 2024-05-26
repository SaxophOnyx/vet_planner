import 'package:json_annotation/json_annotation.dart';

part 'prescription_entity.g.dart';

@JsonSerializable()
class PrescriptionEntity {
  final int id;
  final int patientId;
  final String? comment;

  PrescriptionEntity({
    required this.id,
    required this.patientId,
    required this.comment,
  });

  factory PrescriptionEntity.fromJson(Map<String, dynamic> json) =>
      _$PrescriptionEntityFromJson(json);

  Map<String, dynamic> toJson() => _$PrescriptionEntityToJson(this);
}
