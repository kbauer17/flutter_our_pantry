import 'package:flutter/material.dart';
import 'package:our_pantry/pages/pantry_item.dart';
import 'package:our_pantry/services/pantry_database.dart';

class ItemDetailView extends StatefulWidget {
  const ItemDetailView( {super.key, this.itemId});
  final int? itemId;

  @override
  State<ItemDetailView> createState() => _ItemDetailViewState();
}

class _ItemDetailViewState extends State<ItemDetailView>{
  PantryDatabase pantryDatabase = PantryDatabase.instance;

  TextEditingController nameController = TextEditingController();
  TextEditingController favStoreController = TextEditingController();

  late PantryItem item;
  bool isLoading = false;
  bool isNewItem = false;

  @override
  void initState(){
    refreshItems();
    super.initState();
  }

  // gets an item from the database and updates the state if the itemId is
//not null else it sets the isItemNew to true
  refreshItems() {
    if (widget.itemId == null) {
      setState(() {
        isNewItem = true;
      });
      return;
    }
    pantryDatabase.read(widget.itemId!).then( (value) {
      setState(() {
        item = value;
        nameController.text = item.name;
        favStoreController.text = item.favStore!;
      });
    });
  }

  // creates a new item if the isNewITem is true else it updates the existing item
  createItem(){
    setState(() {
      isLoading = true;
    });
    final model = PantryItem( // match the constructor here
      name: nameController.text,
      favStore: favStoreController.text,
    );
    if (isNewItem) {
      pantryDatabase.create(model);
      Navigator.pop(context);
    }else{
      model.id = item.id;
      pantryDatabase.update(model);
    }
    setState(() {
      isLoading = false;
    });
  }

  //deletes the item from the database and navigates back to the previous screen
  deleteItem(){
    pantryDatabase.delete(item.id!);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        backgroundColor: Colors.blue[600],
        title: const Text(
          'Pantry Item',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          Visibility(
            visible: !isNewItem,
            child: IconButton(
              onPressed: deleteItem,
              icon: const Icon(Icons.delete),
            ),
          ),
          IconButton(
            onPressed: createItem,
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/pantry03.jpg'),
              fit: BoxFit.cover,
            )
          ),

        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : Column(
            children: [
              TextField(
                controller: nameController,
                cursorColor: Colors.white,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  ),
                decoration: const InputDecoration(
                  hintText: 'Name',
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            TextField(
              controller: favStoreController,
              cursorColor: Colors.white,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
              decoration: const InputDecoration(
                hintText: 'Preferred Store',
                border: InputBorder.none,
                hintStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 16
                )
              ),
            ),
          ],),
        ),
      ),
      )
    );
  }

}