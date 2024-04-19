import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:tuban_health/database/migration.dart';

class DatabaseService {
  static Database? _database;
  Migration? migration;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), 'tuban_health.db');
    migration = Migration();

    return await openDatabase(
      path,
      version: migration!.version,
      singleInstance: true,
      onUpgrade: (db, oldVersion, newVersion) {
        migration!.migrate(db, oldVersion, newVersion);
        migration = null;
      },
    );
  }
}