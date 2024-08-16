import 'package:flutter/material.dart';
import 'package:app/navBar.dart';
import 'package:app/recipe.dart';

class savedRecipes extends StatelessWidget {
  const savedRecipes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Recipe(recipeName:  'pasta'),
          Recipe(recipeName: 'fried chicken'),
        ],
      ),
      appBar: AppBar(
        title: Text('Saved Recipes'),
      ),
      bottomNavigationBar: BottomNav(context, 2),
    );
  }
}