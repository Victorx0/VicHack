import 'package:flutter/material.dart';
import 'package:app/ingredients.dart';
import 'package:app/navBar.dart';

class ingredientsPage extends StatefulWidget {
  const ingredientsPage({super.key});

  @override
  State<ingredientsPage> createState() => _ingredientsPageState();
}

class _ingredientsPageState extends State<ingredientsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Ingredient(ingredientName: 'chicken'),
          Ingredient(ingredientName: 'flour'),
        ],
      ),
      appBar: AppBar(
        title: Text('Ingredients'),
        automaticallyImplyLeading: false,
      ),
      bottomNavigationBar: BottomNav(context, 0),
    );
  }
}