import 'package:drift/drift.dart';

class TestModelTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
}
