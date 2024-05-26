import '../../../domain.dart';

class GetPatientByIdUseCase extends FutureUseCase<int, Patient> {
  final PatientRepository _patientRepository;

  GetPatientByIdUseCase({
    required PatientRepository patientRepository,
  }) : _patientRepository = patientRepository;

  @override
  Future<Patient> execute(int payload) async {
    return _patientRepository.getById(id: payload);
  }
}
