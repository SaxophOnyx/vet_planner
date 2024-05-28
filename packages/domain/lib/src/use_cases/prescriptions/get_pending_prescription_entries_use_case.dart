import '../../../domain.dart';

class GetPendingPrescriptionEntriesUseCase
    extends FutureUseCase<NoParams, List<PrescriptionEntry>> {
  final PrescriptionRepository _prescriptionRepository;

  GetPendingPrescriptionEntriesUseCase({
    required PrescriptionRepository prescriptionRepository,
  }) : _prescriptionRepository = prescriptionRepository;

  @override
  Future<List<PrescriptionEntry>> execute([NoParams? payload]) async {
    return _prescriptionRepository.getPendingPrescriptionEntries();
  }
}
