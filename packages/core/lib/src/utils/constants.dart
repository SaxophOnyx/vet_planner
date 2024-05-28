abstract class AppConstants {
  static const int MIN_SPLASH_DURATION_MS = 3500;
  static const int MAX_MEDICATION_NAME_LENGTH = 50;

  static const String HANDLER_A_UNIQUE_NAME = 'scheduleA_U';
  static const String HANDLER_A_TASK_NAME = 'scheduleA';
  static const String HANDLER_B_UNIQUE_NAME = 'scheduleB_U';
  static const String HANDLER_B_TASK_NAME = 'scheduleB';
  // TODO(SaxophOnyx): Replace with proper duration
  static const Duration HANDLER_CALL_PERIOD = Duration(seconds: 30);
  static const int SEARCH_BAR_LIMIT = 5;

  static const int PRESCRIPTION_NOTIFICATION_ID = 42;
  static const String PRESCRIPTION_CHANNEL_ID = 'prescription_channel_id';
  static const String PRESCRIPTION_CHANNEL_NAME = 'Prescription Notification Channel';
  static const int MEDICATION_NOTIFICATION_ID = 43;
  static const String MEDICATION_CHANNEL_ID = 'medication_channel_id';
  static const String MEDICATION_CHANNEL_NAME = 'Medication Notification Channel';
}
