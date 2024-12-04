import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static const _databaseName = "productDataBase.db";
  static const _databaseVersion = 1;

  static const table = 'products';
  static const columnId = '_id';
  static const columnName = 'name';
  static const columnAge = 'age';

  // Singleton
  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // Database instance
  late final Future<Database> _database = _initDatabase();

  Future<Database> get database async => _database;

  // Initialize the database
  Future<Database> _initDatabase() async {
    try {
      String path = join(await getDatabasesPath(), _databaseName);
      return await openDatabase(
        path,
        version: _databaseVersion,
        onCreate: (db, version) async {
          await db.execute('''
           CREATE TABLE $table (
               "product_name"  TEXT,
               "description"  TEXT,
               "price"  REAL,
               "stock"  INTEGER,
               "is_available"  INTEGER
           );
          ''');
        },
      );
    } catch (e) {
      throw Exception("Error by creating table: $e");
    }
  }

  // Insert a new record
  Future<int> insert(Map<String, dynamic> row) async {
    final db = await database;
    return await db.insert(table, row);
  }

  // Fetch all records
  Future<List<Map<String, dynamic>>> queryAllRows() async {
    final db = await database;
    return await db.query(table);
  }

  // Fetch a single record by ID
  Future<Map<String, dynamic>?> queryById(int id) async {
    final db = await database;
    final results = await db.query(
      table,
      where: '$columnId = ?',
      whereArgs: [id],
    );
    return results.isNotEmpty ? results.first : null;
  }

  // Update a record
  Future<int> update(int id, Map<String, dynamic> row) async {
    final db = await database;
    return await db.update(
      table,
      row,
      where: '$columnId = ?',
      whereArgs: [id],
    );
  }

  // Delete a record
  Future<int> delete(int id) async {
    final db = await database;
    return await db.delete(
      table,
      where: '$columnId = ?',
      whereArgs: [id],
    );
  }
}
