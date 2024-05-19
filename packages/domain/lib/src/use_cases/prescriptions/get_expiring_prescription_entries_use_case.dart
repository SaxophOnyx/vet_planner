import '../../../domain.dart';

class GetExpiringPrescriptionEntriesUseCase extends FutureUseCase<NoParams, List<PrescriptionEntry>> {
  final PrescriptionRepository _prescriptionRepository;

  GetExpiringPrescriptionEntriesUseCase({
    required PrescriptionRepository prescriptionRepository,
  }) : _prescriptionRepository = prescriptionRepository;

  @override
  Future<List<PrescriptionEntry>> execute([NoParams? payload]) async {
    return _prescriptionRepository.getExpiringPrescriptionEntries();
  }
}
