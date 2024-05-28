import '../../../domain.dart';

class GetPrescriptionEntriesUseCase extends FutureUseCase<NoParams, List<PrescriptionEntry>> {
  final PrescriptionRepository _prescriptionRepository;

  GetPrescriptionEntriesUseCase({
    required PrescriptionRepository prescriptionRepository,
  }) : _prescriptionRepository = prescriptionRepository;

  @override
  Future<List<PrescriptionEntry>> execute([NoParams? payload]) async {
    return _prescriptionRepository.getPrescriptionEntries();
  }
}
