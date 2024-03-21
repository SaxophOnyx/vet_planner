import '../../domain.dart';

class AddMedicationTypePayload {
  final String name;

  const AddMedicationTypePayload({
    required this.name,
  });
}

class AddMedicationTypeUseCase extends FutureUseCase<AddMedicationTypePayload, MedicationType> {
  @override
  Future<MedicationType> execute(AddMedicationTypePayload payload) async {
    // TODO(SaxophOnyx): implement use-case
    return MedicationType(
      name: payload.name,
    );
  }
}
