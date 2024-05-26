import 'dart:async';

import 'package:domain/domain.dart';

import '../../data.dart';

class MedicationRepositoryImpl implements MedicationRepository {
  final MedicationProvider _medicationProvider;
  final StoredMedicationProvider _storedMedicationProvider;

  final StreamController<StoredMedication> _createdStoredMedicationController =
      StreamController<StoredMedication>.broadcast();

  @override
  Stream<StoredMedication> get createdStoredMedication => _createdStoredMedicationController.stream;

  MedicationRepositoryImpl({
    required MedicationProvider medicationProvider,
    required StoredMedicationProvider storedMedicationProvider,
  })  : _medicationProvider = medicationProvider,
        _storedMedicationProvider = storedMedicationProvider;

  @override
  Future<Medication> addMedication({
    required MedicationType type,
    required String name,
    required int concentrationPerUnit,
  }) async {
    final MedicationEntity entity = await _medicationProvider.addMedication(
      medicationTypeId: MedicationTypeMapper.toEntity(type),
      name: name,
      concentrationPerUnit: concentrationPerUnit,
    );

    return MedicationMapper.fromEntity(entity);
  }

  @override
  Future<StoredMedication> addStoredMedication({
    required int medicationId,
    required DateTime expirationDate,
    required int quantity,
    String? manualTitle,
  }) async {
    final StoredMedicationEntity entity = await _storedMedicationProvider.addStoredMedication(
      medicationId: medicationId,
      expirationDateMsSinceEpoch: DateTimeMapper.toEntity(expirationDate),
      quantity: quantity,
      manualTitle: manualTitle,
    );

    final StoredMedication stored = StoredMedicationMapper.fromEntity(entity);
    _createdStoredMedicationController.add(stored);
    return stored;
  }

  @override
  Future<List<Medication>> getMedications() async {
    final List<MedicationEntity> entities = await _medicationProvider.getMedications();
    return entities.map(MedicationMapper.fromEntity).toList();
  }

  @override
  Future<List<List<StoredMedication>>> getStoredMedications({
    required List<int> medicationIds,
    int? maxItems,
  }) async {
    final List<List<StoredMedication>> result = List<List<StoredMedication>>.empty(growable: true);

    for (final int id in medicationIds) {
      final List<StoredMedicationEntity> entities =
          await _storedMedicationProvider.getStoredMedicationsForId(
        medicationId: id,
        maxItems: maxItems,
      );

      final List<StoredMedication> medications =
          entities.map(StoredMedicationMapper.fromEntity).toList();
      result.add(medications);
    }

    return result;
  }
}
