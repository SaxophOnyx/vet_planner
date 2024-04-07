import 'package:domain/domain.dart';

class InMemoryMedicationRepository implements MedicationRepository {
  final List<Medication> _medications = List<Medication>.empty(growable: true);
  final List<StoredMedication> _storedMedications = List<StoredMedication>.empty(growable: true);
  int _currId = 0;

  @override
  Future<Medication> addMedication({
    required String name,
  }) async {
    final Medication type = Medication(
      name: name,
      id: ++_currId,
    );

    _medications.add(type);

    return type;
  }

  @override
  Future<List<Medication>> getMedications() async {
    return List<Medication>.from(_medications);
  }

  @override
  Future<List<StoredMedication>> getStoredMedications({
    required int medicationId,
  }) async {
    return _storedMedications.where((StoredMedication medication) => medication.medicationId == medicationId).toList();
  }

  @override
  Future<StoredMedication> addStoredMedication({
    required int medicationId,
    required DateTime expirationDate,
  }) async {
    final StoredMedication medication = StoredMedication(
      id: ++_currId,
      medicationId: medicationId,
      expirationDate: expirationDate,
    );

    _storedMedications.add(medication);

    return medication;
  }
}
