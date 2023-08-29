import 'package:flutter/material.dart';
import 'package:meals_app/data/favorite_meals.dart';
import 'package:meals_app/screens/home_screen.dart';
import 'package:meals_app/screens/meals_screen.dart';
import 'package:meals_app/data/meals_data.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() {
    return _TabsState();
  }
}

class _TabsState extends State<TabsScreen> {
  Widget activeScreen = homeScreen();
  int selectedPage = 0;

  void setActiveScreen(int index) {
    setState(() {
      var favMeals = dummyMeals
          .where((element) => favoriteMeals.contains(element))
          .toList();
      selectedPage = index;
      activeScreen = selectedPage == 0
          ? homeScreen()
          : Mealscreen(
              title: 'Favorite Meals',
              meals: favMeals,
            );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: activeScreen,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedPage,
        onTap: (index) {
          setActiveScreen(index);
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal_sharp), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorite  ')
        ],
      ),
    );
  }
}
