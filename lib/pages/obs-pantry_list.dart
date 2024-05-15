import 'package:flutter/material.dart';
import 'package:our_pantry/pages/pantry_item.dart';

import '../services/obs-database.dart';

class PantryList extends StatefulWidget{
  PantryList( {Key? key} ) : super(key:key);

  @override
  State<PantryList> createState() => _PantryListState();
}

class _PantryListState extends State<PantryList>{
  late Database handler;

  // Future<void> addItems() async {
  //   PantryItem firstItem = PantryItem(id: 1, name: 'flour', qtyAtPurchase: 10, unitAtPurchase: 'lbs', favStore: 'Costco', purchasePrice: '10.99');
  //   PantryItem secondItem = PantryItem(id: 2, name: 'sugar', qtyAtPurchase: 10, unitAtPurchase: 'lbs', favStore: 'Costco', purchasePrice: '12.99');
  //   PantryItem thirdItem = PantryItem(id: 3, name: 'eggs', qtyAtPurchase: 2, unitAtPurchase: 'doz', favStore: 'Costco', purchasePrice: '8.99');
  //   PantryItem fourthItem = PantryItem(id: 4, name: 'cinnamon', qtyAtPurchase: 2, unitAtPurchase: 'lbs', favStore: 'Costco', purchasePrice: '19.99');
  //   List<PantryItem> items = [firstItem, secondItem, thirdItem,fourthItem];
  //   return await handler.insertItem(items as PantryItem);
  // }

  @override
  void initState(){
    super.initState();
    handler = Database();
    // handler.database.whenComplete( () async {
    //   await addItems();
    //   setState(() {
    //
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FutureBuilder(
          future: handler.retrievedItems(),
          builder:
          (BuildContext context, AsyncSnapshot<List<PantryItem>>snapshot){
            if(snapshot.hasData){
              return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index){
                  return Card(
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(8.0),
                      title: Text(snapshot.data![index].name),

                    ),
                  );
                });
            } else{
              return const Center(child: CircularProgressIndicator(),);
            }
          },
        ),
      ),
    );
  }
}