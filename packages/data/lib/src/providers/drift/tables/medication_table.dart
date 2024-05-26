import 'package:drift/drift.dart';

class MedicationTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().unique()();
  IntColumn get medicationTypeId => integer()();
  IntColumn get concentrationPerUnit => integer()();
}
