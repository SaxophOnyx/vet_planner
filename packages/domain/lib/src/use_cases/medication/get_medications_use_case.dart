import '../../../domain.dart';

class GetMedicationsUseCase extends FutureUseCase<NoParams, List<Medication>> {
  final MedicationRepository _medicationRepository;

  GetMedicationsUseCase({
    required MedicationRepository medicationRepository,
  }) : _medicationRepository = medicationRepository;

  @override
  Future<List<Medication>> execute([NoParams? payload]) async {
    return _medicationRepository.getMedications();
  }
}
