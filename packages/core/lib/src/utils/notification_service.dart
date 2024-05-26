import 'package:domain/domain.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../../core.dart';

abstract class NotificationService {
  static final FlutterLocalNotificationsPlugin _plugin = FlutterLocalNotificationsPlugin();

  static const AndroidNotificationDetails _prescriptionDetails = AndroidNotificationDetails(
    AppConstants.PRESCRIPTION_CHANNEL_ID,
    AppConstants.PRESCRIPTION_CHANNEL_NAME,
    importance: Importance.max,
    priority: Priority.high,
  );

  static const AndroidNotificationDetails _medicationDetails = AndroidNotificationDetails(
    AppConstants.MEDICATION_CHANNEL_ID,
    AppConstants.MEDICATION_CHANNEL_NAME,
    importance: Importance.max,
    priority: Priority.high,
  );

  static Future<void> initialize() async {
    await _plugin.initialize(
      const InitializationSettings(
        android: AndroidInitializationSettings('mipmap/ic_launcher'),
      ),
    );
  }

  static Future<bool> requestPermission() async {
    final AndroidFlutterLocalNotificationsPlugin? aPlugin = FlutterLocalNotificationsPlugin()
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();

    if (aPlugin == null) {
      throw const AppException();
    }

    final bool? granted = await aPlugin.requestNotificationsPermission();
    return granted ?? false;
  }

  static Future<void> showPrescriptionNotification({
    required String title,
    required String body,
  }) async {
    await _plugin.show(
      AppConstants.PRESCRIPTION_NOTIFICATION_ID,
      title,
      body,
      const NotificationDetails(android: _prescriptionDetails),
    );
  }

  static Future<void> showMedicationNotification({
    required String title,
    required String body,
  }) async {
    await _plugin.show(
      AppConstants.MEDICATION_NOTIFICATION_ID,
      title,
      body,
      const NotificationDetails(android: _medicationDetails),
    );
  }
}
