import 'package:drift/drift.dart';

class PrescriptionEntryTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get prescriptionId => integer()();
  IntColumn get storedMedicationId => integer()();
  IntColumn get dosage => integer()();
  IntColumn get datetimeMsSinceEpoch => integer()();
}
