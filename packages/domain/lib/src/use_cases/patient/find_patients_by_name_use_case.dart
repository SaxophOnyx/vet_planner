import '../../../domain.dart';

class FindPatientsByNamePayload {
  final String name;
  final int limit;

  const FindPatientsByNamePayload({
    required this.name,
    required this.limit,
  });
}

class FindPatientsByNameUseCase extends FutureUseCase<FindPatientsByNamePayload, List<Patient>> {
  final PatientRepository _patientRepository;

  FindPatientsByNameUseCase({
    required PatientRepository patientRepository,
  }) : _patientRepository = patientRepository;

  @override
  Future<List<Patient>> execute(FindPatientsByNamePayload payload) async {
    return _patientRepository.findByName(
      name: payload.name,
      limit: payload.limit,
    );
  }
}
