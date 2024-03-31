import '../../../domain.dart';

class GetStoredMedicationsForMedicationTypeUseCase extends FutureUseCase<int, List<StoredMedication>> {
  final MedicationRepository _medicationRepository;

  GetStoredMedicationsForMedicationTypeUseCase({
    required MedicationRepository medicationRepository,
  }) : _medicationRepository = medicationRepository;

  @override
  Future<List<StoredMedication>> execute(int payload) async {
    return _medicationRepository.getStoredMedications(medicationTypeId: payload);
  }
}
