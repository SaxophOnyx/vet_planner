import 'package:core/core.dart';

import '../../../domain.dart';
import 'test_use_case_helpers.dart';

class PrescriptionPlanEntry {
  final int date;
  final int dose;

  PrescriptionPlanEntry({
    required this.date,
    required this.dose,
  });
}

class TestUseCase extends FutureUseCase<PrescriptionPlan, void> {
  final MedicationRepository _medicationRepository;
  final PrescriptionRepository _prescriptionRepository;
  final PatientRepository _patientRepository;

  TestUseCase({
    required MedicationRepository medicationRepository,
    required PrescriptionRepository prescriptionRepository,
    required PatientRepository patientRepository,
  })  : _medicationRepository = medicationRepository,
        _prescriptionRepository = prescriptionRepository,
        _patientRepository = patientRepository;

  @override
  Future<void> execute(PrescriptionPlan payload) async {
    final Map<int, List<PrescriptionPlanEntry>> plainPlans = processPlan(payload);

    final Map<int, List<StoredMedication>> storedMeds = await _getStored(plainPlans.keys.toList());
    final Map<int, Medication> medications = await _getMedications(
      payload.fixedPlans.map((FixedPrescriptionPlan e) => e.medicationId).toSet(),
    );

    final List<PrescriptionEntry> prescriptions = List<PrescriptionEntry>.empty(growable: true);
    final Map<int, int> reservedStored = <int, int>{};

    for (final MapEntry<int, List<PrescriptionPlanEntry>> plainPlanEntry in plainPlans.entries) {
      final List<PrescriptionPlanEntry> plan = plainPlanEntry.value;

      final Medication? medication = medications[plainPlanEntry.key];
      if (medication == null) {
        throw const ImpossiblePrescriptionException();
      }

      final List<StoredMedication>? currStoredMeds = storedMeds[medication.id];
      if (currStoredMeds == null) {
        throw const ImpossiblePrescriptionException();
      }

      int currStoredIndex = 0;

      StoredMedication? stored = currStoredMeds.tryByIndex(currStoredIndex);
      if (stored == null) {
        throw const ImpossiblePrescriptionException();
      }

      for (final PrescriptionPlanEntry dailyEntry in plan) {
        final int dose = dailyEntry.dose;
        int suppliedDose = 0;

        while (stored != null && suppliedDose < dose) {
          final int remainingDose = dose - suppliedDose;

          if (remainingDose > stored.freeQuantity) {
            reservedStored.update(
              stored.id,
              (int value) => value + stored!.freeQuantity,
              ifAbsent: () => stored!.freeQuantity,
            );

            suppliedDose += stored.freeQuantity;
            ++currStoredIndex;
            stored = currStoredMeds.tryByIndex(currStoredIndex);
          } else {
            suppliedDose = dose;

            reservedStored.update(
              stored.id,
              (int value) => value + remainingDose,
              ifAbsent: () => remainingDose,
            );
          }
        }

        if (stored == null && suppliedDose < dose) {
          throw const ImpossiblePrescriptionException();
        }

        final PrescriptionEntry prescription = PrescriptionEntry(
          id: 0,
          prescriptionId: 0,
          storedMedicationId: stored!.id,
          dosage: dose,
          datetime: DateTime.fromMillisecondsSinceEpoch(dailyEntry.date),
        );

        prescriptions.add(prescription);
      }
    }

    int a = 0;
    a++;

    throw UnimplementedError();
  }

  Future<Map<int, List<StoredMedication>>> _getStored(List<int> medicationIds) async {
    final List<List<StoredMedication>> storedRaw = await _medicationRepository.getStoredMedications(
      medicationIds: medicationIds,
    );

    final Map<int, List<StoredMedication>> stored = <int, List<StoredMedication>>{};

    for (int i = 0; i < storedRaw.length; ++i) {
      stored[medicationIds[i]] = storedRaw[i];
    }

    for (final List<StoredMedication> list in stored.values) {
      list.sort(
        (StoredMedication a, StoredMedication b) => a.expirationDate.compareTo(b.expirationDate),
      );
    }

    return stored;
  }

  Future<Map<int, Medication>> _getMedications(Set<int> medicationIds) async {
    final List<Medication> all = await _medicationRepository.getMedications();

    final Map<int, Medication> medications = <int, Medication>{};

    for (int i = 0; i < all.length; ++i) {
      final Medication medication = all[i];
      final bool hasId = medicationIds.contains(medication.id);

      if (hasId) {
        medications[medication.id] = medication;
      }
    }

    return medications;
  }
}
