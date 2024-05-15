import 'package:our_pantry/pages/pantry_item.dart';
import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';

class Database{


  // Future<Database> database = openDatabase(
  //     join(getDatabasesPath(), 'pantry.db'),
  //     onCreate: (db, version) {
  // return db.execute(
  // 'CREATE TABLE items(id INTEGER PRIMARY KEY, name TEXT NOT NULL, qtyAtPurchase INTEGER, unitAtPurchase TEXT, favStore TEXT, purchasePrice TEXT, qtyOnHand INTEGER, unitOnHand TEXT)' );
  // },
  // version: 1,
  // ) as Future<Database>;

  // insert items
  Future<void> insertItem(PantryItem pantryItem) async {
    // get a reference to the database
    final db = await openDatabase('pantry.db');

    // insert the Item into the correct table.  A ConflictAlgorithm
    // is helpful in the event the Item already exists
    await db.insert('items', pantryItem.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);
    await db.close();
  }

  // update an item
  Future<void> updateItem(PantryItem pantryItem) async {
    final db = await openDatabase('pantry.db');
    await db.update('items', pantryItem.toJson(), where: 'id=?', whereArgs: [pantryItem.id]);
    await db.close();
  }

  // retrieve a list of items
  Future<List<PantryItem>> retrievedItems() async {
    final db = await openDatabase('pantry.db');
    final List<Map<String, Object?>> queryResult = await db.query('pantry');
    return queryResult.map( (e) => PantryItem.fromJson(e)).toList();
  }

  // delete an item
  Future<void> deleteItem(int id) async {
    final db = await openDatabase('pantry.db');
    await db.delete('pantry', where: "id = ?", whereArgs: [id]);
    await db.close();
  }

}