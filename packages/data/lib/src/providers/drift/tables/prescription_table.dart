import 'package:drift/drift.dart';

class PrescriptionTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get patientId => integer()();
  TextColumn get comment => text().nullable()();
}
