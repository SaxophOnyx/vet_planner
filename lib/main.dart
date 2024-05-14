import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

import 'app_di.dart';
import 'vet_planner_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AppLocalization.initialize();

  await setupAppDI();

  // final NotificationsRepository notificationsRepository = appDI.get<NotificationsRepository>();
  // await notificationsRepository.ensureInitialized();

  // await WorkmanagerService.initialize(callback: callbackDispatcher);
  // await WorkmanagerService.ensurePeriodicTaskRegistered();
  // await WorkmanagerService.cancelAll();
  // await WorkmanagerService.scheduleA();
  // await WorkmanagerService.registerOneOffTask();

  runApp(const VetPlannerApp());
}

@pragma('vm:entry-point')
void callbackDispatcher() {
  // WorkmanagerService.executeTask(task: (String name, _) async {
  //   WidgetsFlutterBinding.ensureInitialized();
  //
  //   await setupAppDI();
  //
  //   final NotificationsRepository notificationsRepository = appDI.get<NotificationsRepository>();
  //   await notificationsRepository.ensureInitialized();
  //
  //   await notificationsRepository.showNotification(
  //     title: 'Hello from task $name',
  //   );
  //
  //   return true;
  // });

  WorkmanagerService.executeTask(task: (String name, _) async {
    WidgetsFlutterBinding.ensureInitialized();

    await setupAppDI();

    final NotificationsRepository notificationsRepository = appDI.get<NotificationsRepository>();
    await notificationsRepository.ensureInitialized();

    final DateTime now = DateTime.now();

    await notificationsRepository.showNotification(
      title: 'Task $name: ${now.hour}:${now.minute}:${now.second}',
    );

    await WorkmanagerService.initialize(callback: callbackDispatcher);

    if (name == 'scheduleB') {
      await WorkmanagerService.scheduleA();
    } else if (name == 'scheduleA') {
      await WorkmanagerService.scheduleB();
    }

    return true;
  });
}
