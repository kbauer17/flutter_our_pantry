import 'package:flutter/material.dart';

class ShoppingList extends StatefulWidget {
  const ShoppingList( {super.key} );

  @override
  State<ShoppingList> createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[400],
        appBar: AppBar(
          backgroundColor: Colors.blue[600],
          title: const Text(
            'Shopping List',
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
                child: const Center(
                    child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Under construction',
                          style: TextStyle(
                            fontSize: 24.0,
                            color: Colors.white,
                          ),
                        )
                    )
                )
            )
        )
    );
  }
}