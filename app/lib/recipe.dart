import 'package:flutter/material.dart';
import 'textStyles.dart';

class Recipe extends StatefulWidget {
  final String recipeName, recipeSteps;
  List<String> Ingredients;

  // Constructor should match the class name and correctly initialize recipeName
  Recipe({super.key, required this.recipeName, required this.recipeSteps, required this.Ingredients});

  @override
  State<Recipe> createState() => _RecipeState();
}

class _RecipeState extends State<Recipe> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(245, 245, 247, 1),
              borderRadius: BorderRadius.circular(16.0), // Optional: To make rounded corners
            ),
            child: Padding(
                padding: const EdgeInsets.all(8.0), // Apply padding to all sides
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      this.widget.recipeName,
                      style: h2(),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.blue,
                      ),
                      onPressed: (){
                        Navigator.pushNamed(
                          context,
                          '/recipeInfo',
                          arguments: {
                            'recipeName': widget.recipeName,
                            'recipeSteps': widget.recipeSteps,
                            'Ingredients': widget.Ingredients,
                          }
                        );
                      },
                      child: Text('more info'),
                    ),
                  ],
                )
            ),
          ),
        )
    );;
  }
}

class recipeInfo extends StatefulWidget {
  final String recipeName, recipeSteps;
  List<String> Ingredients;

  // Constructor should match the class name and correctly initialize recipeName
  recipeInfo({super.key, required this.recipeName, required this.recipeSteps, required this.Ingredients});

  @override
  State<recipeInfo> createState() => _recipeInfoState();
}

class _recipeInfoState extends State<recipeInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipeName),
        automaticallyImplyLeading: true,
      ),
      body: Center(
        child: Text(
          widget.Ingredients[0] + ' ' +
          widget.recipeSteps,
          style: h2(),
        ),
      ),
    );
  }
}
