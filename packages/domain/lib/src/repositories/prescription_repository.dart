import '../../domain.dart';

abstract class PrescriptionRepository {
  Future<Prescription> addPrescription({
    required List<ReservationPlanEntry> payloads,
    required int patientId,
    String? comment,
  });

  Future<List<PrescriptionEntry>> getPrescriptionEntries();

  Future<Prescription> getPrescription({required int id});

  Future<void> deletePrescriptionEntries({
    required List<int> ids,
  });

  Future<List<PrescriptionEntry>> getPendingPrescriptionEntries();
}
