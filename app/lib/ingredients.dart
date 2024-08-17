import 'package:flutter/material.dart';


class Ingredient extends StatefulWidget {
  final String ingredientName;
  Ingredient({required this.ingredientName})
  {}
  @override
  State<Ingredient> createState() => _IngredientState();
}

class _IngredientState extends State<Ingredient> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
            padding: const EdgeInsets.all(12.0), // Apply padding to all sides
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '• ' + widget.ingredientName,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Checkbox(
                  value: isChecked, // The current state of the checkbox
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value!; // Update the state when the checkbox is tapped
                    });
                  },
                ),
              ],
            )
        )
    );;
  }
}