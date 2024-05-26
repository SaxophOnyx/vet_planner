import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sqlite3/sqlite3.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

import '../../storage_constants.dart';
import 'tables/medication_table.dart';
import 'tables/patient_table.dart';
import 'tables/prescription_entry_table.dart';
import 'tables/prescription_table.dart';
import 'tables/stored_medications_table.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: <Type>[
  MedicationTable,
  StoredMedicationsTable,
  PrescriptionTable,
  PrescriptionEntryTable,
  PatientTable,
])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 3;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final Directory dbFolder = await getApplicationDocumentsDirectory();
    final File file = File(p.join(dbFolder.path, StorageConstants.databaseFileName));

    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }

    final String cacheBase = (await getTemporaryDirectory()).path;
    sqlite3.tempDirectory = cacheBase;

    return NativeDatabase.createInBackground(file);
  });
}
