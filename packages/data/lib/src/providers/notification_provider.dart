import 'package:core/core.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationProvider {
  final AndroidFlutterLocalNotificationsPlugin _plugin;

  NotificationProvider._internal(this._plugin);

  factory NotificationProvider() {
    final AndroidFlutterLocalNotificationsPlugin? aPlugin = FlutterLocalNotificationsPlugin()
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();

    if (aPlugin == null) {
      throw const AppException.unknown();
    }

    return NotificationProvider._internal(aPlugin);
  }

  Future<void> initialize() async {
    await _plugin.initialize(
      const AndroidInitializationSettings('mipmap/ic_launcher'),
    );
  }

  Future<void> showNotification({
    required String title,
  }) async {
    // TODO(SaxophOnyx): Pass params from repo
    await _plugin.show(
      1,
      title,
      '',
      notificationDetails: const AndroidNotificationDetails(
        'TestChannelID',
        'TestChannelName',
        importance: Importance.max,
        priority: Priority.high,
      ),
    );
  }

  Future<void> showNotification2({
    required String title,
  }) async {
    // TODO(SaxophOnyx): Pass params from repo
    await _plugin.show(
      2,
      title,
      '',
      notificationDetails: const AndroidNotificationDetails(
        'TestChannelID 2',
        'TestChannelName 2',
        importance: Importance.max,
        priority: Priority.high,
      ),
    );
  }
}
