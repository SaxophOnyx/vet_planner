import '../../../domain.dart';

class GetMedicationByIdUseCase extends FutureUseCase<int, Medication> {
  final MedicationRepository _medicationRepository;

  GetMedicationByIdUseCase({
    required MedicationRepository medicationRepository,
  }) : _medicationRepository = medicationRepository;

  @override
  Future<Medication> execute(int payload) async {
    return _medicationRepository.findMedicationById(id: payload);
  }
}
