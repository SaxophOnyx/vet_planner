import 'package:json_annotation/json_annotation.dart';

part 'notification_settings_entity.g.dart';

@JsonSerializable()
class NotificationSettingsEntity {
  final bool receivePrescriptions;
  final bool receiveMedications;

  const NotificationSettingsEntity({
    required this.receivePrescriptions,
    required this.receiveMedications,
  });

  factory NotificationSettingsEntity.fromJson(Map<String, dynamic> json) => _$NotificationSettingsEntityFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationSettingsEntityToJson(this);
}
