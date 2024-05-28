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
    required List<ReservationPlanEntry> payloads,
    required int patientId,
    String? comment,
  }) async {
    final PrescriptionEntity entity = await _prescriptionProvider.addPrescription(
      patientId: patientId,
      comment: comment,
    );

    final List<PrescriptionEntryEntity> entries = payloads
        .map((ReservationPlanEntry payload) => PrescriptionEntryEntity(
              id: 0,
              prescriptionId: entity.id,
              storedMedicationId: payload.storedMedicationId,
              dosage: payload.dose,
              datetimeMsSinceEpoch: payload.datetime.millisecondsSinceEpoch,
            ))
        .toList();

    await _prescriptionEntryProvider.addPrescriptionEntries(
      entries: entries,
    );

    return PrescriptionMapper.fromEntity(entity);
  }

  @override
  Future<List<PrescriptionEntry>> getPrescriptionEntries() async {
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

  @override
  Future<List<PrescriptionEntry>> getPendingPrescriptionEntries() async {
    // TODO(SaxophOnyx): Refactor
    final List<PrescriptionEntryEntity> entries =
        await _prescriptionEntryProvider.getPrescriptionEntries();

    final int now = DateTime.now().millisecondsSinceEpoch;
    return entries
        .where((PrescriptionEntryEntity entry) => entry.datetimeMsSinceEpoch < now)
        .map(PrescriptionEntryMapper.fromEntity)
        .toList();
  }
}
