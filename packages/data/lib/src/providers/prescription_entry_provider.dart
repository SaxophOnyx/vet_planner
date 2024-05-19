import 'package:core/core.dart';

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
    final List<int> ids = <int>[];

    return entries.customMapIndexed(
      (PrescriptionEntryEntity entry, int i) => PrescriptionEntryEntity(
        id: ids[i],
        prescriptionId: entry.prescriptionId,
        storedMedicationId: entry.storedMedicationId,
        dosage: entry.dosage,
        datetimeMsSinceEpoch: entry.datetimeMsSinceEpoch,
      ),
    );
  }
}
