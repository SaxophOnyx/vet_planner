import '../../../domain.dart';

class GetMedicationTypesUseCase extends FutureUseCase<NoParams, List<MedicationType>> {
  final MedicationRepository _medicationRepository;

  GetMedicationTypesUseCase({
    required MedicationRepository medicationRepository,
  }) : _medicationRepository = medicationRepository;

  @override
  Future<List<MedicationType>> execute([NoParams? payload]) async {
    return _medicationRepository.getMedicationTypes();
  }
}
