import '../../domain.dart';

abstract class PrescriptionRepository {
  Future<Prescription> addPrescription({
    required PrescriptionPlan plan,
  });

  Future<List<PrescriptionEntry>> getExpiringPrescriptionEntries();
}
