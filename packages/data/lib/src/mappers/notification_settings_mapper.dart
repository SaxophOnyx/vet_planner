import 'package:domain/domain.dart';

import '../../data.dart';

abstract class NotificationSettingsMapper {
  static NotificationSettings fromEntity(NotificationSettingsEntity entity) {
    return NotificationSettings(
      receivePrescriptions: entity.receivePrescriptions,
      receiveMedications: entity.receiveMedications,
    );
  }
}
