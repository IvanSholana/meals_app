// ignore_for_file: unrelated_type_equality_checks, camel_case_types

import 'package:flutter/material.dart';
import 'package:meals_app/components/category_card.dart';
import 'package:meals_app/data/meals_data.dart';
import 'package:meals_app/screens/meals_screen.dart';
import 'package:meals_app/data/category_data.dart';
import 'package:meals_app/components/drawer.dart';
import 'package:meals_app/data/filter.dart';

var filterMeals = {
  mealsType.isGlutenFree: false,
  mealsType.isVegan: false,
  mealsType.isVegetarian: false,
  mealsType.isLactoseFree: false,
};

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() {
    return _homeScreenState();
  }
}

class _homeScreenState extends State<homeScreen> {
  void setFilter(Map<mealsType, bool> newFilter) {
    setState(() {
      filterMeals = newFilter;
    });
  }

  void selectedCategory(String chooseCategory, String titlePage) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => Mealscreen(
                title: '$titlePage Page',
                meals: dummyMeals
                    .where((element) =>
                        element.categories.contains(chooseCategory) &&
                        (element.isVegan || !filterMeals[mealsType.isVegan]!) &&
                        (element.isGlutenFree ||
                            !filterMeals[mealsType.isGlutenFree]!) &&
                        (element.isLactoseFree ||
                            !filterMeals[mealsType.isLactoseFree]!) &&
                        (element.isVegetarian ||
                            !filterMeals[mealsType.isVegetarian]!))
                    .toList(),
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Pick Your Category")),
        drawer: MainDrawer(setFilter: setFilter, currentFilter: filterMeals),
        body: GridView(
            padding: const EdgeInsets.all(20),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15),
            children: [
              for (var categori in availableCategories)
                CategoryCard(
                  item: categori,
                  selectedCategory: selectedCategory,
                )
            ]));
  }
}
