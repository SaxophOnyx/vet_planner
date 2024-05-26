import 'package:drift/src/runtime/query_builder/query_builder.dart';

import '../../data.dart';

class PatientProvider {
  final AppDatabase _appDatabase;

  PatientProvider({
    required AppDatabase appDatabase,
  }) : _appDatabase = appDatabase;

  Future<PatientEntity?> tryBetByName(String name) async {
    final SimpleSelectStatement<$PatientTableTable, PatientTableData> query = _appDatabase.select(
      _appDatabase.patientTable,
    )..where(($PatientTableTable table) => table.name.equals(name));

    return query
        .map((PatientTableData data) => PatientEntity.fromJson(data.toJson()))
        .getSingleOrNull();
  }

  Future<PatientEntity> getOrCreate(String name) async {
    final PatientEntity? entity = await tryBetByName(name);

    if (entity != null) {
      return entity;
    }

    final int id = await _appDatabase.into(_appDatabase.patientTable).insert(
          PatientTableCompanion.insert(name: name),
        );

    return PatientEntity(
      id: id,
      name: name,
    );
  }

  Future<void> deleteById(int id) async {
    await _appDatabase.delete(_appDatabase.patientTable)
      ..where(($PatientTableTable table) => table.id.equals(id))
      ..go();
  }

  Future<PatientEntity?> getById(int id) async {
    // ignore: always_specify_types
    final query = _appDatabase.select(
      _appDatabase.patientTable,
    )..where(($PatientTableTable table) => table.id.equals(id));

    return query
        .map((PatientTableData data) => PatientEntity.fromJson(data.toJson()))
        .getSingleOrNull();
  }
}
