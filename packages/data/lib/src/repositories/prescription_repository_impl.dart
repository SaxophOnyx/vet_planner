import 'package:domain/domain.dart';

class PrescriptionRepositoryImpl implements PrescriptionRepository {
  @override
  Future<Prescription> addPrescription({
    required PrescriptionPlan plan,
  }) {
    // TODO: implement addPrescription
    throw UnimplementedError();
  }

  @override
  Future<List<PrescriptionEntry>> getExpiringPrescriptionEntries() {
    // TODO: implement getExpiringPrescriptionEntries
    throw UnimplementedError();
  }
}
