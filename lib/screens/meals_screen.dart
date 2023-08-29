// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meals_app/components/meal_card.dart';
import 'package:meals_app/data/meals_class.dart';
import 'package:meals_app/data/favorite_meals.dart';

class Mealscreen extends StatefulWidget {
  Mealscreen({super.key, required this.title, required this.meals});
  List<Meal> meals;
  final String title;
  State<Mealscreen> createState() {
    return _MealsScreenState();
  }
}

class _MealsScreenState extends State<Mealscreen> {
  void showSnackbar(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: Duration(seconds: 1),
    ));
  }

  void addFavorite(Meal meals) {
    if (favoriteMeals.contains(meals)) {
      setState(() {
        favoriteMeals.remove(meals);
        showSnackbar("Meal remove from favorite");
      });
    } else {
      setState(() {
        favoriteMeals.add(meals);
        showSnackbar("Meal added from favorite");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final String title = widget.title;
    final meals = title.contains('Favorite') ? favoriteMeals : widget.meals;
    Widget activeWidget = Center(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Text(
          "Ups Sorry....",
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
        Text(
          "There is nothing to show in here",
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        )
      ]),
    );
    if (meals.isNotEmpty) {
      activeWidget = ListView.builder(
          itemCount: meals.length,
          itemBuilder: (context, index) => MealCard(
                meal: meals[index],
                addFavorite: addFavorite,
              ));
    }

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: activeWidget,
    );
  }
}
