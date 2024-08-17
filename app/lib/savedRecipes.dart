import 'package:flutter/material.dart';
import 'package:app/navBar.dart';
import 'package:app/recipe.dart';

class SavedRecipes extends StatefulWidget {
  const SavedRecipes({super.key});

  @override
  State<SavedRecipes> createState() => _SavedRecipesState();
}

class _SavedRecipesState extends State<SavedRecipes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Recipe(recipeName: 'pasta'),
          Recipe(recipeName: 'fried chicken'),
        ],
      ),
      appBar: AppBar(
        title: Text('Saved Recipes'),
        automaticallyImplyLeading: false,
      ),
      bottomNavigationBar: BottomNav(context, 2),
    );
  }
}
