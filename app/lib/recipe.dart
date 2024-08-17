import 'package:flutter/material.dart';

class Recipe extends StatefulWidget {
  final String recipeName;
  Recipe({required this.recipeName})
  {}

  @override
  State<Recipe> createState() => _RecipeState();
}

class _RecipeState extends State<Recipe> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
            padding: const EdgeInsets.all(16.0), // Apply padding to all sides
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  this.widget.recipeName,
                  style: TextStyle(
                    fontSize: 20,
                  ),),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue,
                  ),
                  onPressed: (){
                    Navigator.pushNamed(context, '/recipeInfo');
                  },
                  child: Text('more info'),
                ),
              ],
            )
        )
    );;
  }
}

class recipeInfo extends StatefulWidget {
  const recipeInfo({super.key});

  @override
  State<recipeInfo> createState() => _recipeInfoState();
}

class _recipeInfoState extends State<recipeInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('recipe name'),
        automaticallyImplyLeading: true,
      ),
      body: Center(
        child: Text(
          'recipe text',
          style: TextStyle(

          ),
        ),
      ),
    );
  }
}
