import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:our_pantry/pages/pantry_item.dart';
import 'package:our_pantry/services/pantry_fields.dart';

class PantryDatabase {
  static final PantryDatabase instance = PantryDatabase._internal();

  static Database? _database;

  PantryDatabase._internal();

  Future<Database> get database async {
    if ( _database != null){
      return _database!;
    }
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'pantry.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDatabase,
    );
  }

  Future<void> _createDatabase(Database db, _) async {
    return await db.execute('''
        CREATE TABLE ${PantryFields.tableName} (
          ${PantryFields.id} ${PantryFields.idType},
          ${PantryFields.name} ${PantryFields.textTypeNotNull},
          ${PantryFields.favStore} ${PantryFields.textType}
        )
    ''');
  }
  // ${PantryFields.qtyAtPurchase} ${PantryFields.intType},
  // ${PantryFields.unitAtPurchase} ${PantryFields.textType},
  // ${PantryFields.purchasePrice} ${PantryFields.textType},
  // ${PantryFields.qtyOnHand} ${PantryFields.intType},
  // ${PantryFields.unitOnHand} ${PantryFields.textType}

  Future<PantryItem> create(PantryItem item) async {
    final db = await instance.database;
    final id = await db.insert(PantryFields.tableName, item.toJson());
    return item.copy(id: id);
  }

  Future<PantryItem> read(int id) async {
    final db = await instance.database;
    final maps = await db.query(
      PantryFields.tableName,
      columns: PantryFields.values,
      where: '${PantryFields.id} = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty){
      return PantryItem.fromJson(maps.first);
    }else{
      throw Exception('ID $id not found');
    }
  }

  Future<List<PantryItem>> readAll() async {
    final db = await instance.database;
    const orderBy = PantryFields.name;
    final result = await db.query(PantryFields.tableName, orderBy: orderBy);
    return result.map( (json) => PantryItem.fromJson(json)).toList();
  }

  Future<int> update(PantryItem item) async {
    final db = await instance.database;
    return db.update(
      PantryFields.tableName,
      item.toJson(),
      where: '${PantryFields.id} = ?',
      whereArgs: [item.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;
    return await db.delete(
      PantryFields.tableName,
      where: '${PantryFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }

}