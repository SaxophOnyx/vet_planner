import '../../../domain.dart';

class GetStoredMedicationByIdUseCase extends FutureUseCase<int, StoredMedication> {
  final MedicationRepository _medicationRepository;

  GetStoredMedicationByIdUseCase({
    required MedicationRepository medicationRepository,
  }) : _medicationRepository = medicationRepository;

  @override
  Future<StoredMedication> execute(int payload) async {
    return _medicationRepository.getStoredMedicationById(id: payload);
  }
}
