import '../../../domain.dart';

class AddMedicationPayload {
  final String name;

  const AddMedicationPayload({
    required this.name,
  });
}

class AddMedicationUseCase extends FutureUseCase<AddMedicationPayload, Medication> {
  final MedicationRepository _medicationRepository;

  AddMedicationUseCase({
    required MedicationRepository medicationRepository,
  }) : _medicationRepository = medicationRepository;

  @override
  Future<Medication> execute(AddMedicationPayload payload) async {
    return _medicationRepository.addMedication(
      name: payload.name,
    );
  }
}
