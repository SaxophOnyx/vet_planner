import 'package:workmanager/workmanager.dart';

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

  static Future<void> ensurePeriodicTaskRegistered() async {
    await _workmanager.registerPeriodicTask(
      'uniqueName',
      'taskName',
      frequency: const Duration(minutes: 15),
      existingWorkPolicy: ExistingWorkPolicy.keep,
    );
  }

  static void executeTask({
    required Future<bool> Function(String, Map<String, dynamic>?) task,
  }) {
    _workmanager.executeTask(task);
  }

  static Future<void> registerOneOffTask() async {
    await _workmanager.registerOneOffTask(
      'uniqueName 2',
      'taskName 2',
      initialDelay: const Duration(seconds: 30),
    );
  }

  static Future<void> cancelAll() => _workmanager.cancelAll();

  static Future<void> scheduleA() async {
    await _workmanager.registerOneOffTask(
      'scheduleA_U',
      'scheduleA',
      initialDelay: const Duration(seconds: 60),
      existingWorkPolicy: ExistingWorkPolicy.replace,
    );
  }

  static Future<void> scheduleB() async {
    await _workmanager.registerOneOffTask(
      'scheduleB_U',
      'scheduleB',
      initialDelay: const Duration(seconds: 60),
      existingWorkPolicy: ExistingWorkPolicy.replace,
    );
  }
}
