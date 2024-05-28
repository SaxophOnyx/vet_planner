import '../../../domain.dart';

class FindMedicationsByNamePayload {
  final String name;
  final int limit;

  FindMedicationsByNamePayload({
    required this.name,
    required this.limit,
  });
}

class FindMedicationsByNameUseCase
    extends FutureUseCase<FindMedicationsByNamePayload, List<Medication>> {
  final MedicationRepository _medicationRepository;

  FindMedicationsByNameUseCase({
    required MedicationRepository medicationRepository,
  }) : _medicationRepository = medicationRepository;

  @override
  Future<List<Medication>> execute(FindMedicationsByNamePayload payload) async {
    return _medicationRepository.findMedicationByName(
      name: payload.name,
      limit: payload.limit,
    );
  }
}
