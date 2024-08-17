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
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('imgs/recipesbg.jpg'),
            fit: BoxFit.cover, // Ensure the image covers the entire container
          ),
        ),
        child: Column(
          children: [
            Recipe(recipeName: 'pasta', recipeSteps: 'this is the recipe', Ingredients: ['a', 'b'],),
            Recipe(recipeName: 'fried chicken', recipeSteps: 'this is the recipe', Ingredients: ['a, b']),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Saved Recipes'),
        automaticallyImplyLeading: false,
      ),
      bottomNavigationBar: BottomNav(context, 2),
    );
  }
}
