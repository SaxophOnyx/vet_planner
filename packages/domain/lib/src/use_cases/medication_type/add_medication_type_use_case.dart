import '../../../domain.dart';

class AddMedicationTypePayload {
  final String name;

  const AddMedicationTypePayload({
    required this.name,
  });
}

class AddMedicationTypeUseCase extends FutureUseCase<AddMedicationTypePayload, MedicationType> {
  final MedicationRepository _medicationRepository;

  AddMedicationTypeUseCase({
    required MedicationRepository medicationRepository,
  }) : _medicationRepository = medicationRepository;

  @override
  Future<MedicationType> execute(AddMedicationTypePayload payload) async {
    return _medicationRepository.addMedicationType(
      name: payload.name,
    );
  }
}
