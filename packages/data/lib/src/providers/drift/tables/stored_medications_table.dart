import 'package:drift/drift.dart';

class StoredMedicationsTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get medicationId => integer()();
  IntColumn get initialQuantity => integer()();
  IntColumn get freeQuantity => integer()();
  IntColumn get reservedQuantity => integer()();
  IntColumn get expirationDateMsSinceEpoch => integer()();
  TextColumn get manualTitle => text().nullable()();
}
