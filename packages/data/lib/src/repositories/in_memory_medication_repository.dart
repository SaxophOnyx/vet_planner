import 'package:domain/domain.dart';

class InMemoryMedicationRepository implements MedicationRepository {
  final List<MedicationType> _medicationTypes = List<MedicationType>.empty(growable: true);
  final List<StoredMedication> _storedMedications = List<StoredMedication>.empty(growable: true);
  int _currId = 0;

  @override
  Future<MedicationType> addMedicationType({
    required String name,
  }) async {
    final MedicationType type = MedicationType(
      name: name,
      id: ++_currId,
    );

    _medicationTypes.add(type);

    return type;
  }

  @override
  Future<List<MedicationType>> getMedicationTypes() async {
    return List<MedicationType>.from(_medicationTypes);
  }

  @override
  Future<List<StoredMedication>> getStoredMedications({
    required int medicationTypeId,
  }) async {
    return _storedMedications
        .where((StoredMedication medication) => medication.medicationTypeId == medicationTypeId)
        .toList();
  }

  @override
  Future<StoredMedication> addStoredMedication({
    required int medicationTypeId,
    required DateTime expirationDate,
  }) async {
    final StoredMedication medication = StoredMedication(
      id: ++_currId,
      medicationTypeId: medicationTypeId,
      expirationDate: expirationDate,
    );

    _storedMedications.add(medication);

    return medication;
  }
}
