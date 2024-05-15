import 'package:our_pantry/services/pantry_fields.dart';

class PantryItem {
  late final int? id;
  late final String name;
  // late final int qtyAtPurchase;
  // late final String unitAtPurchase;
  // late final int qtyOnHand;
  // late final String unitOnHand;
  final String? favStore;
  // late final String purchasePrice;

  PantryItem( {
    this.id,
    required this.name,
    // required this.qtyAtPurchase,
    // required this.unitAtPurchase,
    this.favStore,
    // required this.purchasePrice
  } );

  Map<String, Object?> toJson() => {
    PantryFields.id: id,
    PantryFields.name: name,
    PantryFields.favStore: favStore,
  };

  factory PantryItem.fromJson(Map<String, Object?>json) => PantryItem(
    id: json[PantryFields.id] as int?,
    name: json[PantryFields.name] as String,
    favStore: json[PantryFields.favStore] as String? ?? '',
  );

  PantryItem copy( {
    int? id,
    String? name,
    // int? qtyAtPurchase,
    // String? unitAtPurchase,
    String? favStore,
    // String? purchasePrice,
  })  =>
      PantryItem(
          id: id ?? this.id,
          name: name ?? this.name,
          // qtyAtPurchase: qtyAtPurchase ?? this.qtyAtPurchase,
          // unitAtPurchase: unitAtPurchase ?? this.unitAtPurchase,
          favStore: favStore ?? this.favStore,
          // purchasePrice: purchasePrice ?? this.purchasePrice,
      );

} // close class