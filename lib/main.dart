import 'package:flutter/material.dart';
import 'package:our_pantry/pages/home.dart';
import 'package:our_pantry/pages/pantry_view.dart';
import 'package:our_pantry/pages/recipe_view.dart';
import 'package:our_pantry/pages/shopping_list.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => const Home(),
      '/home': (context) => const Home(),
      '/pantry_view' : (context) => const PantryView(),
      '/recipe_view' : (context) => const RecipeView(),
      '/shopping_list' : (context) => const ShoppingList(),
    },
  ));
}