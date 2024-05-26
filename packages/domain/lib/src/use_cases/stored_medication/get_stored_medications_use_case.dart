import '../../../domain.dart';

class GetStoredMedicationsPayload {
  final List<int> medicationIds;
  final int? maxItems;

  const GetStoredMedicationsPayload({
    required this.medicationIds,
    this.maxItems,
  });
}

class GetStoredMedicationsUseCase
    extends FutureUseCase<GetStoredMedicationsPayload, List<List<StoredMedication>>> {
  final MedicationRepository _medicationRepository;

  GetStoredMedicationsUseCase({
    required MedicationRepository medicationRepository,
  }) : _medicationRepository = medicationRepository;

  @override
  Future<List<List<StoredMedication>>> execute(GetStoredMedicationsPayload payload) async {
    return _medicationRepository.getStoredMedicationsForMedications(
      medicationIds: payload.medicationIds,
      maxItems: payload.maxItems,
    );
  }
}
