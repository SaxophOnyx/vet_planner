import 'package:workmanager/workmanager.dart';

import '../../core.dart';

abstract class WorkmanagerService {
  static final Workmanager _workmanager = Workmanager();

  static Future<void> initialize({
    required Function callback,
  }) async {
    await _workmanager.initialize(
      callback,
      isInDebugMode: true,
    );
  }

  static void executeTask({
    required Future<bool> Function(String, Map<String, dynamic>?) task,
  }) {
    _workmanager.executeTask(task);
  }

  static Future<void> cancelAll() => _workmanager.cancelAll();

  static Future<void> scheduleA() async {
    await _workmanager.registerOneOffTask(
      Constants.HANDLER_A_UNIQUE_NAME,
      Constants.HANDLER_A_TASK_NAME,
      initialDelay: Constants.HANDLER_CALL_PERIOD,
      existingWorkPolicy: ExistingWorkPolicy.replace,
    );
  }

  static Future<void> scheduleB() async {
    await _workmanager.registerOneOffTask(
      Constants.HANDLER_B_UNIQUE_NAME,
      Constants.HANDLER_B_TASK_NAME,
      initialDelay: Constants.HANDLER_CALL_PERIOD,
      existingWorkPolicy: ExistingWorkPolicy.replace,
    );
  }
}
