import '../../../domain.dart';

class AddPrescriptionUseCase extends FutureUseCase<PrescriptionPlan, Prescription> {
  final PrescriptionRepository _prescriptionRepository;

  const AddPrescriptionUseCase({
    required PrescriptionRepository prescriptionRepository,
  }) : _prescriptionRepository = prescriptionRepository;

  @override
  Future<Prescription> execute(PrescriptionPlan payload) async {
    return _prescriptionRepository.addPrescription(
      plan: payload,
    );
  }
}
