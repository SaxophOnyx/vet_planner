import '../../domain.dart';

abstract class PatientRepository {
  Future<Patient> getOrCreatePatient({
    required String name,
  });

  Future<Patient?> tryGetByName({
    required String name,
  });

  Future<void> deletePatient({required int id});

  Future<Patient> getById({required int id});

  Future<List<Patient>> findByName({
    required String name,
    required int limit,
  });
}
