import 'package:flutter/material.dart';

BottomNavigationBar BottomNav(BuildContext context, pageIndex) {
  return BottomNavigationBar(
    currentIndex: pageIndex,
    items: [
      BottomNavigationBarItem(
        label: 'Ingredients',
        icon: Icon(Icons.shopping_bag_outlined),
      ),
      BottomNavigationBarItem(
        label: 'Home',
        icon: Icon(Icons.home_outlined),
      ),
      BottomNavigationBarItem(
        label: 'Saved',
        icon: Icon(Icons.favorite_outline),
      ),
    ],
    onTap: (int pageIndex) {
      switch (pageIndex) {
        case 0:
          Navigator.pushNamed(context, '/ingredients');
          break;
        case 1:
          Navigator.pushNamed(context, '/home');
          break;
        case 2:
          Navigator.pushNamed(context, '/savedRecipes');
          break;
      }
    },
  );
}