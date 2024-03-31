import '../../../domain.dart';

class AddStoredMedicationPayload {
  final int medicationTypeId;
  final DateTime expirationDate;

  const AddStoredMedicationPayload({
    required this.medicationTypeId,
    required this.expirationDate,
  });
}

class AddStoredMedicationUseCase extends FutureUseCase<AddStoredMedicationPayload, StoredMedication> {
  final MedicationRepository _medicationRepository;

  AddStoredMedicationUseCase({
    required MedicationRepository medicationRepository,
  }) : _medicationRepository = medicationRepository;

  @override
  Future<StoredMedication> execute(AddStoredMedicationPayload payload) async {
    return _medicationRepository.addStoredMedication(
      medicationTypeId: payload.medicationTypeId,
      expirationDate: payload.expirationDate,
    );
  }
}
