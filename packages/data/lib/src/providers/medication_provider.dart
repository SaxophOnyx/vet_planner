import '../../data.dart';

class MedicationProvider {
  final AppDatabase _appDatabase;

  const MedicationProvider({
    required AppDatabase appDatabase,
  }) : _appDatabase = appDatabase;

  Future<List<MedicationEntity>> getMedications() async {
    return _appDatabase
        .select(_appDatabase.medicationTable)
        .map((MedicationTableData data) => MedicationEntity.fromJson(data.toJson()))
        .get();
  }

  Future<MedicationEntity> addMedication({
    required int medicationTypeId,
    required String name,
    required int concentrationPerUnit,
  }) async {
    final int id = await _appDatabase.into(_appDatabase.medicationTable).insert(
          MedicationTableCompanion.insert(
            name: name,
            medicationTypeId: medicationTypeId,
            concentrationPerUnit: concentrationPerUnit,
          ),
        );

    return MedicationEntity(
      id: id,
      name: name,
      medicationTypeId: medicationTypeId,
      concentrationPerUnit: concentrationPerUnit,
    );
  }
}
