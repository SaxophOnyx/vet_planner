import 'package:domain/domain.dart';

import '../../data.dart';

part 'prescription_repository_impl_helpers.dart';

class PrescriptionRepositoryImpl implements PrescriptionRepository {
  final MedicationProvider _medicationProvider;
  final StoredMedicationProvider _storedMedicationProvider;
  final PrescriptionProvider _prescriptionProvider;
  final PrescriptionEntryProvider _prescriptionEntryProvider;

  PrescriptionRepositoryImpl({
    required MedicationProvider medicationProvider,
    required StoredMedicationProvider storedMedicationProvider,
    required PrescriptionProvider prescriptionProvider,
    required PrescriptionEntryProvider prescriptionEntryProvider,
  })  : _medicationProvider = medicationProvider,
        _storedMedicationProvider = storedMedicationProvider,
        _prescriptionProvider = prescriptionProvider,
        _prescriptionEntryProvider = prescriptionEntryProvider;

  @override
  Future<Prescription> addPrescription({
    required PrescriptionPlan plan,
  }) async {
    throw UnimplementedError();

    final Map<int, List<_PrescriptionPlanEntry>> flatPlans = _processPlan(plan);

    final Map<int, List<StoredMedicationEntity>> storedMedications = await _storedMedicationProvider
        .getStoredMedicationsForIds(medicationIds: flatPlans.keys.toList());

    for (final List<StoredMedicationEntity> list in storedMedications.values) {
      list.sort(
        (StoredMedicationEntity a, StoredMedicationEntity b) =>
            a.expirationDateMsSinceEpoch.compareTo(b.expirationDateMsSinceEpoch),
      );
    }

    final List<PrescriptionEntryEntity> prescriptionEntries =
        List<PrescriptionEntryEntity>.empty(growable: true);

    for (final MapEntry<int, List<_PrescriptionPlanEntry>> flatPlanEntry in flatPlans.entries) {
      final List<_PrescriptionPlanEntry> flatPlan = flatPlanEntry.value;
      final List<StoredMedicationEntity>? stored = storedMedications[flatPlanEntry.key];

      if (stored == null) {
        throw const ImpossiblePrescriptionException();
      }

      int currStoredIndex = 0;

      for (final _PrescriptionPlanEntry entry in flatPlan) {}
    }
  }

  @override
  Future<List<PrescriptionEntry>> getExpiringPrescriptionEntries() async {
    final List<PrescriptionEntryEntity> entities =
        await _prescriptionEntryProvider.getPrescriptionEntries();

    entities.sort(
      (PrescriptionEntryEntity a, PrescriptionEntryEntity b) =>
          a.datetimeMsSinceEpoch.compareTo(b.datetimeMsSinceEpoch),
    );

    return entities.map(PrescriptionEntryMapper.fromEntity).toList();
  }

  @override
  Future<void> deletePrescriptionEntries({
    required List<int> ids,
  }) async {
    // TODO(SaxophOnyx): Implement
    final List<PrescriptionEntryEntity> deleted =
        await _prescriptionEntryProvider.deletePrescriptions(ids: ids);

    final int prescriptionId = deleted.first.prescriptionId;
  }

  @override
  Future<Prescription> getPrescription({required int id}) async {
    final PrescriptionEntity? entity = await _prescriptionProvider.getPrescriptionById(id);

    if (entity != null) {
      return PrescriptionMapper.fromEntity(entity);
    }

    throw const AppException();
  }
}
