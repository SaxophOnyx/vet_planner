import '../../../domain.dart';

class AddMedicationPayload {
  final MedicationType type;
  final String name;
  final int concentrationPerUnit;

  const AddMedicationPayload({
    required this.type,
    required this.name,
    required this.concentrationPerUnit,
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
      type: payload.type,
      name: payload.name,
      concentrationPerUnit: payload.concentrationPerUnit,
    );
  }
}
