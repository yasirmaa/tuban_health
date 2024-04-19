import 'package:sqflite/sqflite.dart';
import 'package:tuban_health/database/table_names.dart';

class Migration{
  final List<String> queries = [
    '''
      CREATE TABLE ${TableNames.markerMap} (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        description TEXT NOT NULL,
        address TEXT NOT NULL,
        latitude REAL NOT NULL,
        longitude REAL NOT NULL
      )
    '''
  ];

  int get version => queries.length;

  Future<void> migrate(Database db, int currentVersion, int toVersion) async {
    for (int i = currentVersion; i < toVersion; i++) {
      await db.execute(queries[i]);
    }
  }
}
