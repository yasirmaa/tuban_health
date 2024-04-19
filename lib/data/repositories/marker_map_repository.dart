import 'package:tuban_health/database/database_service.dart';
import 'package:tuban_health/database/table_names.dart';
import 'package:tuban_health/data/models/marker_map.dart';

class MarkerMapRepository{
  final tableName = TableNames.markerMap;

  Future<int> insert(MarkerMap markerMap) async {
    return await (await DatabaseService().database)
        .insert(tableName, markerMap.toJson());
  }

  Future<int> update(MarkerMap markerMap) async {
    final db = await DatabaseService().database;
    return await db.update(tableName, markerMap.toJson(),
        where: 'id = ?', whereArgs: [markerMap.id]);
  }

  Future<int> delete(int id) async {
    return await (await DatabaseService().database)
        .delete(tableName, where: 'id = ?', whereArgs: [id]);
  }

  Future<List<MarkerMap>> getAll() async {
    final db = await DatabaseService().database;
    final result = await db.query(tableName);
    return result.map((json) => MarkerMap.fromJson(json)).toList();
  }
}
