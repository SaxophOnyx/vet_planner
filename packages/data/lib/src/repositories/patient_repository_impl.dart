import 'package:domain/domain.dart';

import '../../data.dart';
import '../mappers/patient_mapper.dart';

class PatientRepositoryImpl implements PatientRepository {
  final PatientProvider _patientProvider;

  PatientRepositoryImpl({
    required PatientProvider patientProvider,
  }) : _patientProvider = patientProvider;

  @override
  Future<void> deletePatient({required int id}) async {
    await _patientProvider.deleteById(id);
  }

  @override
  Future<Patient> getOrCreatePatient({required String name}) async {
    final PatientEntity entity = await _patientProvider.getOrCreate(name);
    return PatientMapper.fromEntity(entity);
  }

  @override
  Future<Patient?> tryGetByName({required String name}) async {
    final PatientEntity? entity = await _patientProvider.tryBetByName(name);

    if (entity != null) {
      return PatientMapper.fromEntity(entity);
    }

    return null;
  }

  @override
  Future<Patient> getById({required int id}) async {
    final PatientEntity? entity = await _patientProvider.getById(id);

    if (entity != null) {
      return PatientMapper.fromEntity(entity);
    }

    throw const AppException();
  }

  @override
  Future<List<Patient>> findByName({
    required String name,
    required int limit,
  }) async {
    final List<PatientEntity> entities = await _patientProvider.findByName(
      name: name,
      limit: limit,
    );

    return entities.map(PatientMapper.fromEntity).toList();
  }
}
