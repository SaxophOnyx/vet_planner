import '../../../domain.dart';

class GetPrescriptionByIdUseCase extends FutureUseCase<int, Prescription> {
  final PrescriptionRepository _prescriptionRepository;

  GetPrescriptionByIdUseCase({
    required PrescriptionRepository prescriptionRepository,
  }) : _prescriptionRepository = prescriptionRepository;

  @override
  Future<Prescription> execute(int payload) async {
    return _prescriptionRepository.getPrescription(id: payload);
  }
}
