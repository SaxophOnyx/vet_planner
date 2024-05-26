import 'package:core/core.dart';
import 'package:drift/drift.dart';

import '../../data.dart';

class PrescriptionEntryProvider {
  final AppDatabase _appDatabase;

  PrescriptionEntryProvider({
    required AppDatabase appDatabase,
  }) : _appDatabase = appDatabase;

  Future<List<PrescriptionEntryEntity>> getPrescriptionEntries() async {
    return _appDatabase
        .select(_appDatabase.prescriptionEntryTable)
        .map((PrescriptionEntryTableData data) => PrescriptionEntryEntity.fromJson(data.toJson()))
        .get();
  }

  Future<List<PrescriptionEntryEntity>> addPrescriptionEntries({
    required List<PrescriptionEntryEntity> entries,
  }) async {
    final SimpleSelectStatement<$PrescriptionEntryTableTable, PrescriptionEntryTableData> query =
        _appDatabase.select(_appDatabase.prescriptionEntryTable)
          ..orderBy(
            <OrderClauseGenerator<$PrescriptionEntryTableTable>>[
              ($PrescriptionEntryTableTable row) => OrderingTerm(
                    expression: row.id,
                    mode: OrderingMode.desc,
                  ),
            ],
          )
          ..limit(1);

    final PrescriptionEntryTableData? lastRow = await query.getSingleOrNull();

    final int firstFreeId = (lastRow?.id ?? 0) + 1;

    await _appDatabase.batch((Batch batch) {
      batch.insertAll(
        _appDatabase.prescriptionEntryTable,
        entries
            .map<PrescriptionEntryTableCompanion>(
              (PrescriptionEntryEntity e) => PrescriptionEntryTableCompanion.insert(
                prescriptionId: e.prescriptionId,
                storedMedicationId: e.storedMedicationId,
                dosage: e.storedMedicationId,
                datetimeMsSinceEpoch: e.storedMedicationId,
              ),
            )
            .toList(),
      );
    });

    return entries.customMapIndexed(
      (PrescriptionEntryEntity entry, int i) => PrescriptionEntryEntity(
        id: firstFreeId + i,
        prescriptionId: entry.prescriptionId,
        storedMedicationId: entry.storedMedicationId,
        dosage: entry.dosage,
        datetimeMsSinceEpoch: entry.datetimeMsSinceEpoch,
      ),
    );
  }

  Future<List<PrescriptionEntryEntity>> deletePrescriptions({required List<int> ids}) async {
    // ignore: always_specify_types
    final statement = await _appDatabase.delete(_appDatabase.prescriptionEntryTable)
      ..where(($PrescriptionEntryTableTable table) => table.id.isIn(ids));

    final List<PrescriptionEntryTableData> rows = await statement.goAndReturn();

    return rows
        .map((PrescriptionEntryTableData row) => PrescriptionEntryEntity.fromJson(row.toJson()))
        .toList();
  }
}
