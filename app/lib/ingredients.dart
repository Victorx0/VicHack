import 'package:flutter/material.dart';
import 'package:app/textStyles.dart';

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
            padding: const EdgeInsets.all(4.0), // Apply padding to all sides
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white24,
                borderRadius: BorderRadius.circular(8.0), // Optional: To make rounded corners
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '•  ' + widget.ingredientName,
                      style: h2(),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isChecked = !isChecked;
                        });
                      },
                      child: Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          color: isChecked ? Colors.black54 : Colors.white24,
                          border: Border.all(color: Colors.black54, width: 3),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: isChecked
                            ? Icon(Icons.check, size: 18.0, color: Colors.white)
                            : null,
                      ),
                    )
                  ],
                ),
              ),
            )
        )
    );;
  }
}