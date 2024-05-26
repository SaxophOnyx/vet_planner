import '../../domain.dart';

abstract class PrescriptionRepository {
  Future<Prescription> addPrescription({
    required PrescriptionPlan plan,
  });

  Future<List<PrescriptionEntry>> getExpiringPrescriptionEntries();

  Future<Prescription> getPrescription({required int id});

  Future<void> deletePrescriptionEntries({
    required List<int> ids,
  });
}
