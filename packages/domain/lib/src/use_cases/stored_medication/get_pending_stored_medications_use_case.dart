import '../../../domain.dart';

class GetPendingStoredMedicationsUseCase extends FutureUseCase<NoParams, List<StoredMedication>> {
  final MedicationRepository _medicationRepository;

  GetPendingStoredMedicationsUseCase({
    required MedicationRepository medicationRepository,
  }) : _medicationRepository = medicationRepository;

  @override
  Future<List<StoredMedication>> execute([NoParams? payload]) async {
    return _medicationRepository.getPendingStoredMedications();
  }
}
