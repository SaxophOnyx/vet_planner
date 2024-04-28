import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

import 'app_di.dart';
import 'vet_planner_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AppLocalization.initialize();

  await setupAppDI();

  final MedicationRepository repo = appDI.get<MedicationRepository>();

  final Medication added = await repo.addMedication(
    type: MedicationType.ampoule,
    name: 'name + ${DateTime.now().microsecond}',
    concentrationPerUnit: 50,
  );

  final List<Medication> medications = await repo.getMedications();

  final StoredMedication stored = await repo.addStoredMedication(
    medicationId: added.id,
    expirationDate: DateTime.now(),
    quantity: 2000,
    manualTitle: 'I have manual title',
  );

  final List<List<StoredMedication>> allStored = await repo.getStoredMedications(
    medicationIds: medications.map((Medication m) => m.id).toList(),
  );

  runApp(const VetPlannerApp());
}
