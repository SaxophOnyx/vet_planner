import 'package:domain/domain.dart';

class InMemoryMedicationRepository implements MedicationRepository {
  final List<Medication> _medications = List<Medication>.from(
    <Medication>[
      const Medication(
        id: 1,
        name: 'Medication 1',
        type: MedicationType.ampoule,
        concentrationPerUnit: 50,
      ),
      const Medication(
        id: 2,
        name: 'Medication 2',
        type: MedicationType.tablet,
        concentrationPerUnit: 25,
      ),
    ],
    growable: true,
  );

  final List<StoredMedication> _storedMedications = List<StoredMedication>.from(
    <StoredMedication>[
      StoredMedication(
        id: 3,
        medicationId: 1,
        expirationDate: DateTime.now(),
        initialQuantity: 1000,
        remainingQuantity: 800,
        reservedQuantity: 500,
      ),
      StoredMedication(
        id: 4,
        medicationId: 1,
        expirationDate: DateTime.now(),
        initialQuantity: 1000,
        remainingQuantity: 800,
        reservedQuantity: 500,
      ),
      StoredMedication(
        id: 5,
        medicationId: 2,
        expirationDate: DateTime.now(),
        initialQuantity: 1000,
        remainingQuantity: 800,
        reservedQuantity: 500,
      ),
      StoredMedication(
        id: 6,
        medicationId: 2,
        expirationDate: DateTime.now(),
        initialQuantity: 1000,
        remainingQuantity: 800,
        reservedQuantity: 500,
      ),
      StoredMedication(
        id: 7,
        medicationId: 2,
        expirationDate: DateTime.now(),
        initialQuantity: 1000,
        remainingQuantity: 800,
        reservedQuantity: 500,
      ),
    ],
    growable: true,
  );

  int _currId = 100;

  @override
  Future<Medication> addMedication({
    required MedicationType type,
    required String name,
    required int concentrationPerUnit,
  }) async {
    final Medication medication = Medication(
      type: type,
      name: name,
      id: ++_currId,
      concentrationPerUnit: concentrationPerUnit,
    );

    _medications.add(medication);

    return medication;
  }

  @override
  Future<List<Medication>> getMedications() async {
    return List<Medication>.from(_medications);
  }

  @override
  Future<List<List<StoredMedication>>> getStoredMedications({
    required List<int> medicationIds,
    int? maxItems,
  }) async {
    final List<List<StoredMedication>> result = <List<StoredMedication>>[];

    for (final int id in medicationIds) {
      final List<StoredMedication> stored = _storedMedications
          .where((StoredMedication medication) => medication.medicationId == id)
          // TODO(SaxophOnyx): Refactor
          .take(maxItems ?? 1000)
          .toList();

      result.add(stored);
    }

    return result;
  }

  @override
  Future<StoredMedication> addStoredMedication({
    required int medicationId,
    required DateTime expirationDate,
    required int quantity,
  }) async {
    final StoredMedication medication = StoredMedication(
      id: ++_currId,
      medicationId: medicationId,
      expirationDate: expirationDate,
      initialQuantity: quantity,
      remainingQuantity: quantity,
      reservedQuantity: 0,
    );

    _storedMedications.add(medication);

    return medication;
  }
}
