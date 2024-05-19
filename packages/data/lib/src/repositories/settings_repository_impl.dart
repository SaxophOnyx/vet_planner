import 'package:domain/domain.dart';

import '../../data.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  final NotificationSettingsProvider _provider;

  SettingsRepositoryImpl({
    required NotificationSettingsProvider notificationSettingsProvider,
  }) : _provider = notificationSettingsProvider;

  @override
  Future<NotificationSettings> getNotificationSettings() async {
    final NotificationSettingsEntity? entity = await _provider.getSettings();

    if (entity == null) {
      return const NotificationSettings.initial();
    }

    return NotificationSettingsMapper.fromEntity(entity);
  }

  @override
  Future<NotificationSettings> updateNotificationSettings({
    required bool receivePrescriptions,
    required bool receiveMedications,
  }) async {
    final NotificationSettingsEntity entity = NotificationSettingsEntity(
      receivePrescriptions: receivePrescriptions,
      receiveMedications: receiveMedications,
    );

    await _provider.updateSettings(entity);

    return NotificationSettingsMapper.fromEntity(entity);
  }
}
