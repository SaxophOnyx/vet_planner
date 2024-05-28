import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:flutter/material.dart';

import 'app_di.dart';
import 'vet_planner_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AppLocalization.initialize();

  await setupAppDI();

  // await test();
  // return;

  await NotificationService.initialize();
  await WorkmanagerService.initialize(callback: callbackDispatcher);

  runApp(const VetPlannerApp());
}

Future<void> test() async {
  final StoredMedicationProvider provider = appDI.get<StoredMedicationProvider>();

  final List<StoredMedicationEntity> empty = await provider.getStoredMedications(
    const <int>[1, 2, 3],
  );

  final StoredMedicationEntity a = await provider.addStoredMedication(
    medicationId: 1,
    expirationDateMsSinceEpoch: DateTime.now().millisecondsSinceEpoch,
    quantity: 100,
  );

  final StoredMedicationEntity b = await provider.addStoredMedication(
    medicationId: 1,
    expirationDateMsSinceEpoch: DateTime.now().millisecondsSinceEpoch,
    quantity: 100,
  );

  final StoredMedicationEntity c = await provider.addStoredMedication(
    medicationId: 1,
    expirationDateMsSinceEpoch: DateTime.now().millisecondsSinceEpoch,
    quantity: 100,
  );

  final List<StoredMedicationEntity> created = await provider.getStoredMedications(
    const <int>[1, 2, 3],
  );

  await provider.updateStoredMedications(
    created
        .customMapIndexed((StoredMedicationEntity entity, int index) => StoredMedicationEntity(
              id: entity.id,
              medicationId: entity.medicationId,
              initialQuantity: entity.initialQuantity,
              freeQuantity: entity.freeQuantity - 100 * index,
              reservedQuantity: entity.reservedQuantity + 100 * index,
              expirationDateMsSinceEpoch: entity.expirationDateMsSinceEpoch,
              manualTitle: entity.manualTitle,
            ))
        .toList(),
  );

  final List<StoredMedicationEntity> updated = await provider.getStoredMedications(
    const <int>[1, 2, 3],
  );

  int value = 0;
  value++;
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
