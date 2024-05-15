import 'package:flutter/material.dart';
import 'package:our_pantry/pages/pantry_view.dart';
import 'package:our_pantry/pages/recipe_view.dart';
import 'package:our_pantry/pages/shopping_list.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  // navigate to the itemDetailView and refresh items after the navigation
  goToPantryView() async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const PantryView()),
    );
  }

  goToRecipeView() async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const RecipeView()),
    );
  }

  goToShoppingList() async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ShoppingList()),
    );
  }

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        backgroundColor: Colors.blue[600],
        title: const Text(
          'OurPantry',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/pantry01.jpg'),
              fit: BoxFit.cover,
            )
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(40.0, 60.0, 0.0, 0),
                child: Card(
                  elevation: 0,
                  color: Colors.transparent,
                  child: ListTile(
                    onTap: () => goToPantryView(),
                    title: const Text(
                        'View and Update Pantry',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 1.25,
                          shadows: [
                            Shadow(
                              blurRadius:6.0,  // shadow blur
                              color: Colors.black, // shadow color
                              offset: Offset(2.0,2.0), // how much shadow will be shown
                            ),
                          ],
                        ),
                    ),
                    // leading: const CircleAvatar(
                    //   backgroundImage: AssetImage('assets/pantry02'),
                    // ),
                  ),
                        ),
              ),
              const SizedBox(height: 5.0,),
              Padding(
                padding: const EdgeInsets.fromLTRB(40.0, 20.0, 0, 0),
                child: Card(
                  elevation: 0,
                  color: Colors.transparent,
                  child: ListTile(
                    onTap: () => goToRecipeView(),
                    title: const Text(
                      'View and Add Recipes',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 1.25,
                        shadows: [
                          Shadow(
                            blurRadius:6.0,  // shadow blur
                            color: Colors.black, // shadow color
                            offset: Offset(2.0,2.0), // how much shadow will be shown
                          ),
                        ],
                      ),
                    ),
                    // leading: const CircleAvatar(
                    //   backgroundImage: AssetImage('assets/pantry02'),
                    // ),
                  ),
                ),
              ),
              const SizedBox(height: 5.0,),
              Padding(
                padding: const EdgeInsets.fromLTRB(40.0, 20.0, 0, 0),
                child: Card(
                  elevation: 0,
                  color: Colors.transparent,
                  child: ListTile(
                    onTap: () => goToShoppingList(),
                    title: const Text(
                      'View Shopping List',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 1.25,
                        shadows: [
                          Shadow(
                            blurRadius:6.0,  // shadow blur
                            color: Colors.black, // shadow color
                            offset: Offset(2.0,2.0), // how much shadow will be shown
                          ),
                        ],
                      ),
                    ),
                    // leading: const CircleAvatar(
                    //   backgroundImage: AssetImage('assets/pantry02'),
                    // ),
                  ),
                ),
              ),
            ],
          ),
        )
      )
    );
  }

}

