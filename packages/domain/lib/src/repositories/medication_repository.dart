import '../../domain.dart';

abstract class MedicationRepository {
  Stream<StoredMedication> get createdStoredMedication;

  Future<List<Medication>> getMedications();

  Future<Medication> addMedication({
    required MedicationType type,
    required String name,
    required int concentrationPerUnit,
  });

  Future<List<List<StoredMedication>>> getStoredMedicationsForMedications({
    required List<int> medicationIds,
    int? maxItems,
  });

  Future<StoredMedication> addStoredMedication({
    required int medicationId,
    required DateTime expirationDate,
    required int quantity,
    String? manualTitle,
  });

  Future<List<Medication>> findMedicationByName({
    required String name,
    required int limit,
  });

  Future<Medication> findMedicationById({required int id});

  Future<StoredMedication> getStoredMedicationById({required int id});

  Future<List<StoredMedication>> getPendingStoredMedications();

  Future<ReservationPlanResult?> tryGetReservationPlan({
    required Set<int> medicationIds,
    required Map<int, List<PlainPrescriptionPlanEntry>> plainPlans,
  });

  Future<void> reserveStoredMedications({
    required Map<int, int> quantities,
  });
}
