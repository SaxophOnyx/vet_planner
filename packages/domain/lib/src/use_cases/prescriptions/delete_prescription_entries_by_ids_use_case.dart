import '../../../domain.dart';

class DeletePrescriptionEntriesByIdsUseCase extends FutureUseCase<List<int>, void> {
  final PrescriptionRepository _prescriptionRepository;

  DeletePrescriptionEntriesByIdsUseCase({
    required PrescriptionRepository prescriptionRepository,
  }) : _prescriptionRepository = prescriptionRepository;

  @override
  Future<void> execute(List<int> payload) async {
    await _prescriptionRepository.deletePrescriptionEntries(ids: payload);
  }
}
