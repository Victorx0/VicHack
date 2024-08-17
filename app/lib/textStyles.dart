import 'package:flutter/material.dart';

TextStyle h1() {
  return TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.black54,
    shadows: [BlackTextShadow()],
  );
}

TextStyle h2() {
  return TextStyle(
    fontSize: 22,
    color: Colors.black54,
    shadows: [BlackTextShadow()],
  );
}

TextStyle h3() {
  return TextStyle(
    fontSize: 20,
    color: Colors.black54,
    shadows: [BlackTextShadow()],
  );
}

Shadow BlackTextShadow() {
  return Shadow(
    color: Colors.blueGrey.withOpacity(0.8),
    offset: Offset(0, 0), // Shadow offset
    blurRadius: 2, // Shadow blur radius
  );
}