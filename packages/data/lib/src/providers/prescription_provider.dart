import 'package:drift/drift.dart';

import '../../data.dart';

class PrescriptionProvider {
  final AppDatabase _appDatabase;

  PrescriptionProvider({
    required AppDatabase appDatabase,
  }) : _appDatabase = appDatabase;

  Future<PrescriptionEntity> addPrescription({
    required int patientId,
    String? comment,
  }) async {
    final int id = await _appDatabase.into(_appDatabase.prescriptionTable).insert(
          PrescriptionTableCompanion.insert(
            patientId: patientId,
            comment: Value<String?>(comment),
          ),
        );

    return PrescriptionEntity(
      id: id,
      patientId: patientId,
      comment: comment,
    );
  }

  Future<PrescriptionEntity?> getPrescriptionById(int id) async {
    // ignore: always_specify_types
    final query = _appDatabase.select(
      _appDatabase.prescriptionTable,
    )..where(($PrescriptionTableTable table) => table.id.equals(id));

    return query
        .map((PrescriptionTableData data) => PrescriptionEntity.fromJson(data.toJson()))
        .getSingleOrNull();
  }

  Future<void> deletePrescription({required int id}) async {
    await _appDatabase.delete(_appDatabase.prescriptionTable)
      ..where(($PrescriptionTableTable table) => table.id.equals(id))
      ..go();
  }
}
