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

  // await test2();
  // return;

  // final NotificationsRepository notificationsRepository = appDI.get<NotificationsRepository>();
  // await notificationsRepository.ensureInitialized();

  // await WorkmanagerService.initialize(callback: callbackDispatcher);
  // await WorkmanagerService.ensurePeriodicTaskRegistered();
  // await WorkmanagerService.cancelAll();
  // await WorkmanagerService.scheduleA();
  // await WorkmanagerService.registerOneOffTask();

  runApp(const VetPlannerApp());
}

Future<void> test2() async {
  final PatientProvider provider = appDI.get<PatientProvider>();

  final PatientEntity? before = await provider.tryBetByName('Bob');

  final PatientEntity created = await provider.getOrCreate('Bob');

  final PatientEntity? afterCreation = await provider.tryBetByName('Bob');

  await provider.deleteById(created.id);

  final PatientEntity? afterDeletion = await provider.tryBetByName('Bob');

  int a = 0;
  ++a;
}

Future<void> test() async {
  final PrescriptionEntryProvider provider = appDI.get<PrescriptionEntryProvider>();

  final List<PrescriptionEntryEntity> before = await provider.getPrescriptionEntries();

  await provider.deletePrescriptions(
    ids: const <int>[2, 4],
  );

  final List<PrescriptionEntryEntity> afterDelete = await provider.getPrescriptionEntries();

  final List<PrescriptionEntryEntity> created = await provider.addPrescriptionEntries(
    entries: const <PrescriptionEntryEntity>[
      PrescriptionEntryEntity(
        id: 0,
        prescriptionId: 1,
        storedMedicationId: 1,
        dosage: 1,
        datetimeMsSinceEpoch: 11,
      ),
      PrescriptionEntryEntity(
        id: 0,
        prescriptionId: 2,
        storedMedicationId: 2,
        dosage: 2,
        datetimeMsSinceEpoch: 22,
      ),
    ],
  );

  final List<PrescriptionEntryEntity> afterCreate = await provider.getPrescriptionEntries();

  int a = 0;
  ++a;
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
