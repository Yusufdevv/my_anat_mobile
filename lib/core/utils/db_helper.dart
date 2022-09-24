import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  const DbHelper._privateConstructor();
  static const DbHelper instance = DbHelper._privateConstructor();

  static const _dbName = 'anatomica.db';
  static const _version = 3;
  static late Database _database;
  static bool _isDbInitialized = false;

  Future<Database> get database async {
    if (_isDbInitialized) {
      return _database;
    } else {
      final db = await _initDatabase();
      return db;
    }
  }

  Future<Database> _initDatabase() async {
    final directory = await getApplicationDocumentsDirectory();
    final path = join(directory.path, _dbName);
    _database = await openDatabase(path, version: _version, onCreate: (db, version) async {
      await db.execute(
        '''
      CREATE TABLE IF NOT EXISTS downloaded_journals (
       id INTEGER PRIMARY KEY AUTOINCREMENT,
       title TEXT,
       path TEXT,
       downloaded INTEGER
      )
      ''',
      );
    });
    _isDbInitialized = true;
    return _database;
  }

  Future<List<Map<String, dynamic>>> rawQuery(String query, [List<Object>? args]) async {
    final db = await instance.database;
    return await db.rawQuery(query, args);
  }

  Future<int> rawUpdate(String query, [List<Object>? args]) async {
    final db = await instance.database;
    return await db.rawUpdate(query, args);
  }

  Future<int> insert(String table, Map<String, dynamic> row) async {
    final db = await instance.database;
    for (final cell in row.entries) {
      if (cell.value is bool) {
        row.update(cell.key, (dynamic value) => value == true ? 1 : 0);
      }
    }
    return await db.insert(table, row, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> deleteAll(String table) async {
    final db = await instance.database;
    await db.rawDelete('DELETE FROM $table');
  }

  Future<List<Map<String, dynamic>>> getLastRaw(String table, String column) async {
    final db = await instance.database;
    return await db.rawQuery('SELECT * FROM $table ORDER BY $column DESC LIMIT 1');
  }

  Future<List<Map<String, dynamic>>> queryAll(String table) async {
    final db = await instance.database;
    return await db.query(table);
  }

  Future<List<Map<String, dynamic>>> queryByForeignKey(String table, int key, String where) async {
    final db = await instance.database;
    return await db.query(table, where: '$where = ?', whereArgs: [key]);
  }

  Future update(String table, Map<String, dynamic> row) async {
    final db = await instance.database;

    for (final cell in row.entries) {
      if (cell.value is bool) {
        row.update(cell.key, (dynamic value) => value == true ? 1 : 0);
      }
    }
    final dynamic id = row['id'];
    return await db.update(table, row, where: 'id = ?', whereArgs: [id]);
  }

  Future updateByOfflineId(String table, Map<String, dynamic> row) async {
    final db = await instance.database;

    for (final cell in row.entries) {
      if (cell.value is bool) {
        row.update(cell.key, (dynamic value) => value == true ? 1 : 0);
      }
    }
    final dynamic id = row['offline_id'];
    return await db.update(table, row, where: 'offline_id = ?', whereArgs: [id]);
  }

  Future<int> delete(String table, String book) async {
    final db = await instance.database;
    return await db.delete(table, where: 'path = ?', whereArgs: [book]);
  }

  Future<List<Map<String, dynamic>>> query(String table, String where, dynamic key) async {
    final db = await instance.database;

    return await db.query(table, where: '$where = ?', whereArgs: [key]);
  }

  Future<List<Map<String, dynamic>>> queryForNull(String table, String where) async {
    final db = await instance.database;

    return await db.rawQuery('SELECT * FROM $table WHERE $where IS NULL');
  }

  Future<List<Map<String, dynamic>>> queryWithOp(String table, String where, String op, dynamic key) async {
    final db = await instance.database;

    return await db.query(table, where: '$where $op ?', whereArgs: [key]);
  }
}
