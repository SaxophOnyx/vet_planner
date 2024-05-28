import 'dart:async';

import 'package:core/core.dart';
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
  Future<List<List<StoredMedication>>> getStoredMedicationsForMedications({
    required List<int> medicationIds,
    int? maxItems,
  }) async {
    final List<List<StoredMedication>> result = List<List<StoredMedication>>.empty(growable: true);

    for (final int id in medicationIds) {
      final List<StoredMedicationEntity> entities =
          await _storedMedicationProvider.getStoredMedicationsForMedicationId(
        medicationId: id,
        maxItems: maxItems,
      );

      final List<StoredMedication> medications =
          entities.map(StoredMedicationMapper.fromEntity).toList();
      result.add(medications);
    }

    return result;
  }

  @override
  Future<List<Medication>> findMedicationByName({
    required String name,
    required int limit,
  }) async {
    final List<MedicationEntity> entities = await _medicationProvider.findByName(
      name: name,
      limit: limit,
    );

    return entities.map(MedicationMapper.fromEntity).toList();
  }

  @override
  Future<List<StoredMedication>> getPendingStoredMedications() async {
    final int start = DateTime.now().millisecondsSinceEpoch;

    final List<StoredMedicationEntity> entities =
        await _storedMedicationProvider.getExpiredStoredMedicationsSince(start);

    return entities.map(StoredMedicationMapper.fromEntity).toList();
  }

  @override
  Future<ReservationPlanResult?> tryGetReservationPlan({
    required Set<int> medicationIds,
    required Map<int, List<PlainPrescriptionPlanEntry>> plainPlans,
  }) async {
    final Map<int, int> reservationQuantities = <int, int>{};
    final List<ReservationPlanEntry> reservationPlan = List<ReservationPlanEntry>.empty(
      growable: true,
    );

    final Map<int, Medication> medications = await _getMedications(medicationIds);
    final Map<int, List<StoredMedication>> storedMeds = await _getStored(plainPlans.keys.toList());

    for (final MapEntry<int, List<PlainPrescriptionPlanEntry>> plainPlanEntry
        in plainPlans.entries) {
      final List<PlainPrescriptionPlanEntry> plan = plainPlanEntry.value;

      final Medication? medication = medications[plainPlanEntry.key];
      if (medication == null) {
        return null;
      }

      final List<StoredMedication>? currStoredMeds = storedMeds[medication.id];
      if (currStoredMeds == null) {
        return null;
      }

      int currStoredIndex = 0;

      StoredMedication? stored = currStoredMeds.tryByIndex(currStoredIndex);
      if (stored == null) {
        return null;
      }

      for (final PlainPrescriptionPlanEntry dailyEntry in plan) {
        final int dose = dailyEntry.dose;
        int suppliedDose = 0;

        while (stored != null && suppliedDose < dose) {
          final int remainingDose = dose - suppliedDose;
          final int remainingFree = stored.freeQuantity - (reservationQuantities[stored.id] ?? 0);

          if (remainingDose > remainingFree) {
            reservationQuantities.update(
              stored.id,
              (int value) => value + remainingFree,
              ifAbsent: () => remainingFree,
            );

            suppliedDose += remainingFree;
            ++currStoredIndex;
            stored = currStoredMeds.tryByIndex(currStoredIndex);
          } else {
            suppliedDose = dose;

            reservationQuantities.update(
              stored.id,
              (int value) => value + remainingDose,
              ifAbsent: () => remainingDose,
            );
          }
        }

        if (stored == null && suppliedDose < dose) {
          return null;
        }

        final ReservationPlanEntry reservationEntry = ReservationPlanEntry(
          storedMedicationId: stored!.id,
          datetime: dailyEntry.datetime,
          dose: dose,
        );

        reservationPlan.add(reservationEntry);
      }
    }

    return ReservationPlanResult(
      entries: reservationPlan,
      reservationQuantities: reservationQuantities,
    );
  }

  Future<Map<int, Medication>> _getMedications(Set<int> medicationIds) async {
    final List<Medication> all = await getMedications();

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

  Future<Map<int, List<StoredMedication>>> _getStored(List<int> medicationIds) async {
    final List<List<StoredMedication>> storedRaw = await getStoredMedicationsForMedications(
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

  @override
  Future<void> reserveStoredMedications({
    required Map<int, int> quantities,
  }) async {
    final List<StoredMedicationEntity> entities =
        await _storedMedicationProvider.getStoredMedications(quantities.keys.toList());

    final List<StoredMedicationEntity> updated = entities.map((StoredMedicationEntity entity) {
      final int? quantity = quantities[entity.id];

      if (quantity == null) {
        throw const AppException();
      }

      return StoredMedicationEntity(
        id: entity.id,
        medicationId: entity.medicationId,
        initialQuantity: entity.initialQuantity,
        freeQuantity: entity.freeQuantity - quantity,
        reservedQuantity: entity.reservedQuantity + quantity,
        expirationDateMsSinceEpoch: entity.expirationDateMsSinceEpoch,
        manualTitle: entity.manualTitle,
      );
    }).toList();

    await _storedMedicationProvider.updateStoredMedications(updated);
  }

  @override
  Future<Medication> findMedicationById({required int id}) async {
    final MedicationEntity? entity = await _medicationProvider.findById(id);

    if (entity == null) {
      throw const AppException();
    }

    return MedicationMapper.fromEntity(entity);
  }

  @override
  Future<StoredMedication> getStoredMedicationById({required int id}) async {
    final List<StoredMedicationEntity> stored =
        await _storedMedicationProvider.getStoredMedications(<int>[id]);

    final StoredMedicationEntity? entity = stored.firstOrNull;

    if (entity == null) {
      throw const AppException();
    }

    return StoredMedicationMapper.fromEntity(entity);
  }
}
