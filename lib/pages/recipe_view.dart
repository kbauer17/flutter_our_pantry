import 'package:flutter/material.dart';

class RecipeView extends StatefulWidget {
  const RecipeView( {super.key} );

  @override
  State<RecipeView> createState() => _RecipeViewState();
}

class _RecipeViewState extends State<RecipeView> {


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
          'Recipe List',
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