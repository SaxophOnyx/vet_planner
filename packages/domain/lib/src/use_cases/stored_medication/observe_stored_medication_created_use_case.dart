import '../../../domain.dart';

class ObserveStoredMedicationCreatedUseCase extends StreamUseCase<NoParams, StoredMedication> {
  final MedicationRepository _medicationRepository;

  ObserveStoredMedicationCreatedUseCase({
    required MedicationRepository medicationRepository,
  }) : _medicationRepository = medicationRepository;

  @override
  Stream<StoredMedication> execute([NoParams? payload]) {
    return _medicationRepository.createdStoredMedication;
  }
}
