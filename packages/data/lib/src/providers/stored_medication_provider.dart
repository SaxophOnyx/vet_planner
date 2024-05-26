import 'package:drift/drift.dart';

import '../../data.dart';

class StoredMedicationProvider {
  final AppDatabase _appDatabase;

  const StoredMedicationProvider({
    required AppDatabase appDatabase,
  }) : _appDatabase = appDatabase;

  Future<List<StoredMedicationEntity>> getStoredMedicationsForMedicationId({
    required int medicationId,
    int? maxItems,
  }) async {
    final SimpleSelectStatement<$StoredMedicationsTableTable, StoredMedicationsTableData> query =
        _appDatabase.select(_appDatabase.storedMedicationsTable)
          ..where(($StoredMedicationsTableTable table) => table.medicationId.equals(medicationId))
          // TODO(SaxophOnyx): Refactor const
          ..limit(maxItems ?? 10000);

    return query
        .map((StoredMedicationsTableData data) => StoredMedicationEntity.fromJson(data.toJson()))
        .get();
  }

  Future<Map<int, List<StoredMedicationEntity>>> getStoredMedicationsForMedicationIds({
    required List<int> medicationIds,
  }) async {
    // TODO(SaxophOnyx): Refactor to avoid multiple DB calls
    final Map<int, List<StoredMedicationEntity>> result = <int, List<StoredMedicationEntity>>{};

    for (final int id in medicationIds) {
      final List<StoredMedicationEntity> storedMedications =
          await getStoredMedicationsForMedicationId(medicationId: id);

      result[id] = storedMedications;
    }

    return result;
  }

  Future<StoredMedicationEntity> addStoredMedication({
    required int medicationId,
    required int expirationDateMsSinceEpoch,
    required int quantity,
    String? manualTitle,
  }) async {
    final int initialQuantity = quantity;
    final int freeQuantity = quantity;
    const int reservedQuantity = 0;

    final int id = await _appDatabase.into(_appDatabase.storedMedicationsTable).insert(
          StoredMedicationsTableCompanion.insert(
            medicationId: medicationId,
            initialQuantity: initialQuantity,
            freeQuantity: freeQuantity,
            reservedQuantity: reservedQuantity,
            expirationDateMsSinceEpoch: expirationDateMsSinceEpoch,
            manualTitle: Value<String?>(manualTitle),
          ),
        );

    return StoredMedicationEntity(
      id: id,
      medicationId: medicationId,
      initialQuantity: initialQuantity,
      freeQuantity: freeQuantity,
      reservedQuantity: reservedQuantity,
      expirationDateMsSinceEpoch: expirationDateMsSinceEpoch,
      manualTitle: manualTitle,
    );
  }

  // TODO(SaxophOnyx): Check
  Future<List<StoredMedicationEntity>> getExpiredStoredMedicationsSince(int datetimeMs) async {
    // ignore: always_specify_types
    final query = _appDatabase.storedMedicationsTable.select()
      ..where(
        ($StoredMedicationsTableTable table) => table.expirationDateMsSinceEpoch.isSmallerThanValue(
          datetimeMs,
        ),
      );

    return query
        .map((StoredMedicationsTableData data) => StoredMedicationEntity.fromJson(data.toJson()))
        .get();
  }
}
