import 'package:domain/domain.dart';

import '../providers/notification_provider.dart';

class NotificationRepositoryImpl implements NotificationsRepository {
  final NotificationProvider _notificationProvider;

  bool _wasInitialized = false;

  NotificationRepositoryImpl({
    required NotificationProvider notificationProvider,
  }) : _notificationProvider = notificationProvider;

  @override
  Future<void> ensureInitialized() async {
    if (!_wasInitialized) {
      await _notificationProvider.initialize();
      _wasInitialized = true;
    }
  }

  @override
  Future<void> showNotification({
    required String title,
  }) async {
    await _notificationProvider.showNotification(
      title: title,
    );
  }
}
