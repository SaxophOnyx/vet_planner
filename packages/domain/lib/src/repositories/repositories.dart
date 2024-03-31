import '../../domain.dart';

abstract class MedicationRepository {
  Future<List<MedicationType>> getMedicationTypes();

  Future<MedicationType> addMedicationType({
    required String name,
  });

  Future<List<StoredMedication>> getStoredMedications({
    required int medicationTypeId,
  });

  Future<StoredMedication> addStoredMedication({
    required int medicationTypeId,
    required DateTime expirationDate,
  });
}
