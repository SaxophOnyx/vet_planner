// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_settings_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationSettingsEntity _$NotificationSettingsEntityFromJson(
        Map<String, dynamic> json) =>
    NotificationSettingsEntity(
      receivePrescriptions: json['receivePrescriptions'] as bool,
      receiveMedications: json['receiveMedications'] as bool,
    );

Map<String, dynamic> _$NotificationSettingsEntityToJson(
        NotificationSettingsEntity instance) =>
    <String, dynamic>{
      'receivePrescriptions': instance.receivePrescriptions,
      'receiveMedications': instance.receiveMedications,
    };
