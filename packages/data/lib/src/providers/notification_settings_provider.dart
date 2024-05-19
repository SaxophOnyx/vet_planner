import 'dart:convert';

import '../../data.dart';
import '../storage_constants.dart';

class NotificationSettingsProvider {
  final LocalDataProvider _localDataProvider;

  const NotificationSettingsProvider({
    required LocalDataProvider localDataProvider,
  }) : _localDataProvider = localDataProvider;

  Future<NotificationSettingsEntity?> getSettings() async {
    final String? data = await _localDataProvider.read(
      StorageConstants.notificationSettingKey,
    );

    if (data == null) {
      return null;
    }

    return NotificationSettingsEntity.fromJson(jsonDecode(data));
  }

  Future<void> updateSettings(NotificationSettingsEntity entity) async {
    final String data = jsonEncode(entity.toJson());

    await _localDataProvider.write(
      key: StorageConstants.notificationSettingKey,
      value: data,
    );
  }
}
