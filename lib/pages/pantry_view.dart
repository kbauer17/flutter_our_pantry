import 'package:flutter/material.dart';
import 'package:our_pantry/pages/pantry_item.dart';
import 'package:our_pantry/services/pantry_database.dart';
import 'package:our_pantry/pages/item_detail_view.dart';

class PantryView extends StatefulWidget {
  const PantryView( {super.key} );

  @override
  State<PantryView> createState() => _PantryViewState();
}

class _PantryViewState extends State<PantryView>{
  PantryDatabase pantryDatabase = PantryDatabase.instance;

  List<PantryItem> items = [];

  @override
  void initState() {
    refreshItems();
    super.initState();
  }

  // @override
  // dispose() {
  //   // close the database
  //   pantryDatabase.close();
  //   super.dispose();
  // }

  //get all items from the database and update state
  refreshItems() {
    pantryDatabase.readAll().then( (value) {
      setState(() {
        items = value;
      });
    });
  }

  // navigate to the itemDetailView and refresh items after the navigation
  goToItemDetailView( {int? id} ) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ItemDetailView(itemId: id)),
    );
    refreshItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        backgroundColor: Colors.blue[600],
        title: const Text(
          'Current Pantry Contents',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/pantry02.jpg'),
              fit: BoxFit.cover,
            )
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: items.isEmpty
                ? const Text(
                    'No items yet',
                    style: TextStyle(
                        fontSize: 24.0,
                        color: Colors.white,
                    ),
                  )
                  : ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        final item = items[index];
                        return GestureDetector(
                          onTap: () => goToItemDetailView(id: item.id),
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      item.name,
                                      style: Theme.of(context).textTheme.headlineMedium,
                                      )
                                    ],
                                  ),
                                ),
                          ),
                          ),
                        );
                  }),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: goToItemDetailView,
        tooltip: 'Create Item',
        child: const Icon(Icons.add),
      ),
    );
  }

}