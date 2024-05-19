import '../../domain.dart';

abstract class SettingsRepository {
  Future<NotificationSettings> getNotificationSettings();

  Future<void> updateNotificationSettings({
    required bool receivePrescriptions,
    required bool receiveMedications,
  });
}
