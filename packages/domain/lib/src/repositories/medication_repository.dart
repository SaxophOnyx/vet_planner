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

  Future<List<Medication>> findByName({
    required String name,
    required int limit,
  });

  Future<List<StoredMedication>> getPendingStoredMedications();
}
