import 'package:drift/drift.dart';

import '../../data.dart';

class StoredMedicationProvider {
  final AppDatabase _appDatabase;

  const StoredMedicationProvider({
    required AppDatabase appDatabase,
  }) : _appDatabase = appDatabase;

  Future<List<StoredMedicationEntity>> getStoredMedications({
    required int medicationId,
    int? maxItems,
  }) async {
    final SimpleSelectStatement<$StoredMedicationsTableTable, StoredMedicationsTableData> query =
        _appDatabase.select(_appDatabase.storedMedicationsTable)
          ..where(($StoredMedicationsTableTable table) => table.id.equals(medicationId))
          // TODO(SaxophOnyx): Refactor const
          ..limit(maxItems ?? 10000);

    return query.map((StoredMedicationsTableData data) => StoredMedicationEntity.fromJson(data.toJson())).get();
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
}
