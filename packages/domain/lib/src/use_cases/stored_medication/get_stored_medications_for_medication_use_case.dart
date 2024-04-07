import '../../../domain.dart';

class GetStoredMedicationsForMedicationUseCase extends FutureUseCase<int, List<StoredMedication>> {
  final MedicationRepository _medicationRepository;

  GetStoredMedicationsForMedicationUseCase({
    required MedicationRepository medicationRepository,
  }) : _medicationRepository = medicationRepository;

  @override
  Future<List<StoredMedication>> execute(int payload) async {
    return _medicationRepository.getStoredMedications(medicationId: payload);
  }
}
