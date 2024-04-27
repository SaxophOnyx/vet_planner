import 'package:drift/drift.dart';

import '../../data.dart';

class TestModelProvider {
  final AppDatabase _db;

  TestModelProvider({
    required AppDatabase appDatabase,
  }) : _db = appDatabase;

  Future<void> test() async {
    await _db.into(_db.testModelTable).insert(
          TestModelTableCompanion.insert(
            id: Value<int>(DateTime.now().millisecondsSinceEpoch),
            name: '',
          ),
        );

    final List<TestModelTableData> data = await _db.select(_db.testModelTable).get();

    int g = 0;
    g++;
  }
}
