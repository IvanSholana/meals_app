// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:meals_app/data/meals_class.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:meals_app/screens/detail_meals.dart';

class MealCard extends StatelessWidget {
  MealCard({super.key, required this.meal, required this.addFavorite});
  Meal meal;
  final void Function(Meal meals) addFavorite;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        clipBehavior: Clip.hardEdge,
        elevation: 2,
        child: InkWell(
          child: Stack(
            children: [
              FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(meal.imageUrl),
                fit: BoxFit.cover,
                width: double.infinity,
                height: 200,
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.black54,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          meal.title,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground),
                          maxLines: 2,
                          softWrap: true,
                          overflow: TextOverflow.clip,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.timer_sharp),
                          const SizedBox(width: 5),
                          Text('${meal.duration.toString()}min',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground)),
                          const SizedBox(
                            width: 20,
                          ),
                          const Icon(Icons.auto_awesome_outlined),
                          const SizedBox(width: 5),
                          Text(
                              meal.complexity.name[0].toUpperCase() +
                                  meal.complexity.name.substring(1),
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground)),
                          const SizedBox(
                            width: 20,
                          ),
                          const Icon(Icons.monetization_on),
                          const SizedBox(width: 5),
                          Text(
                              meal.affordability.name[0].toUpperCase() +
                                  meal.affordability.name.substring(1),
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground))
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      DetailScreen(meals: meal, addFavorite: addFavorite),
                ));
          },
        ),
      ),
    );
  }
}
