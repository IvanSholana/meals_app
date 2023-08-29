// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:meals_app/data/meals_class.dart';
import 'package:meals_app/data/favorite_meals.dart';

class DetailScreen extends StatefulWidget {
  DetailScreen({super.key, required this.meals, required this.addFavorite});
  Meal meals;
  void Function(Meal meal) addFavorite;
  State<DetailScreen> createState() {
    return _DetailStateScreen();
  }
}

class _DetailStateScreen extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    Meal meals = widget.meals;

    return Scaffold(
      appBar: AppBar(
        title: Text(meals.title),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                widget.addFavorite(meals);
              });
            },
            icon: Icon(Icons.star),
            color: favoriteMeals.contains(meals) ? Colors.yellow : null,
          )
        ],
      ),
      body: Column(children: [
        FadeInImage(
            placeholder: MemoryImage(kTransparentImage),
            image: NetworkImage(meals.imageUrl)),
        Expanded(
          child: SingleChildScrollView(
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "Ingredients",
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(color: Theme.of(context).colorScheme.primary),
                ),
              ),
              for (var ingredient in meals.ingredients)
                Padding(
                  padding: const EdgeInsets.only(bottom: 2),
                  child: Text(
                    ingredient,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground),
                  ),
                ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  "Steps",
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(color: Theme.of(context).colorScheme.primary),
                ),
              ),
              for (var step in meals.steps)
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 10, left: 10, right: 10),
                  child: Text(
                    step,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground),
                    textAlign: TextAlign.center,
                  ),
                )
            ]),
          ),
        )
      ]),
    );
  }
}
