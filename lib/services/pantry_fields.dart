class PantryFields {
  static const String tableName = 'items';
  static const String idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
  static const String textTypeNotNull = 'TEXT NOT NULL';
  static const String textType = 'TEXT';
  static const String intType = 'INTEGER';
  static const String id = '_id';
  static const String name = 'name';
  // static const String qtyAtPurchase = 'qtyAtPurchase';
  // static const String unitAtPurchase = 'unitAtPurchase';
  // static const String qtyOnHand = 'qtyOnHand';
  // static const String unitOnHand = 'unitOnHand';
  static const String favStore = 'favStore';
  // static const String purchasePrice = 'purchasePrice';
  static const List<String> values = [
    id, name, favStore,
  ];
}