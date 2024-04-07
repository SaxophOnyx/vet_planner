import '../../domain.dart';

abstract class MedicationRepository {
  Future<List<Medication>> getMedications();

  Future<Medication> addMedication({
    required String name,
  });

  Future<List<StoredMedication>> getStoredMedications({
    required int medicationId,
  });

  Future<StoredMedication> addStoredMedication({
    required int medicationId,
    required DateTime expirationDate,
  });
}
