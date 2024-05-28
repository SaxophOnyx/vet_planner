import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

import 'app_di.dart';
import 'vet_planner_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AppLocalization.initialize();

  await setupAppDI();

  await NotificationService.initialize();
  await WorkmanagerService.initialize(callback: callbackDispatcher);

  await WorkmanagerService.scheduleA();

  runApp(const VetPlannerApp());
}

@pragma('vm:entry-point')
void callbackDispatcher() {
  WorkmanagerService.executeTask(
    task: (String name, _) async {
      WidgetsFlutterBinding.ensureInitialized();
      await setupAppDI();
      await WorkmanagerService.initialize(callback: callbackDispatcher);
      await NotificationService.initialize();

      final NotificationSettings settings =
          await appDI.get<GetNotificationSettingsUseCase>().execute();

      if (settings.receivePrescriptions) {
        final List<PrescriptionEntry> prescriptions =
            await appDI.get<GetPendingPrescriptionEntriesUseCase>().execute();

        if (prescriptions.isNotEmpty || true) {
          await NotificationService.showPrescriptionNotification(
            title: 'You have pending prescriptions!',
            body: name,
          );
        }
      }

      if (settings.receiveMedications) {
        final List<StoredMedication> medications =
            await appDI.get<GetPendingStoredMedicationsUseCase>().execute();

        if (medications.isNotEmpty) {
          await NotificationService.showMedicationNotification(
            title: 'You have expiring medications!',
            body: name,
          );
        }
      }

      await WorkmanagerService.scheduleNext(name);
      return true;
    },
  );

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

  // WorkmanagerService.executeTask(task: (String name, _) async {
  //   WidgetsFlutterBinding.ensureInitialized();
  //
  //   await setupAppDI();
  //
  //   await NotificationService.initialize();
  //
  //   final DateTime now = DateTime.now();
  //
  //   await notificationsRepository.showNotification(
  //     title: 'Task $name: ${now.hour}:${now.minute}:${now.second}',
  //   );
  //
  //   await WorkmanagerService.initialize(callback: callbackDispatcher);
  //
  //   if (name == 'scheduleB') {
  //     await WorkmanagerService.scheduleA();
  //   } else if (name == 'scheduleA') {
  //     await WorkmanagerService.scheduleB();
  //   }
  //
  //   return true;
  // });
}
