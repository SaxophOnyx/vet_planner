import '../../../domain.dart';

class AddStoredMedicationPayload {
  final int medicationId;
  final DateTime expirationDate;

  const AddStoredMedicationPayload({
    required this.medicationId,
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
      medicationId: payload.medicationId,
      expirationDate: payload.expirationDate,
    );
  }
}
