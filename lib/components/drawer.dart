import 'package:flutter/material.dart';
import 'package:meals_app/screens/filter_screen.dart';
import 'package:meals_app/data/filter.dart';

// ignore: must_be_immutable
class MainDrawer extends StatelessWidget {
  MainDrawer({super.key, required this.setFilter, required this.currentFilter});
  final currentFilter;
  void Function(Map<mealsType, bool>) setFilter;
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(children: [
      DrawerHeader(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Theme.of(context).colorScheme.primaryContainer.withOpacity(0.5),
          Theme.of(context).colorScheme.primaryContainer
        ])),
        child: Row(
          children: [
            Icon(
              Icons.fastfood,
              color: Theme.of(context).colorScheme.primary,
              size: 35,
            ),
            Text(
              "Coocking Up!",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.primary),
            )
          ],
        ),
      ),
      ListTile(
        title: Text(
          'Meals',
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: Theme.of(context).colorScheme.onBackground, fontSize: 24),
        ),
        leading: Icon(
          Icons.restaurant,
          size: 26,
          color: Theme.of(context).colorScheme.onBackground,
        ),
        onTap: () {},
      ),
      ListTile(
        title: Text(
          'Filters',
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: Theme.of(context).colorScheme.onBackground, fontSize: 24),
        ),
        leading: Icon(
          Icons.settings,
          size: 26,
          color: Theme.of(context).colorScheme.onBackground,
        ),
        onTap: () async {
          Navigator.pop(context);
          var result = await Navigator.push<Map<mealsType, bool>>(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    FilterScreen(currentFilter: currentFilter),
              ));
          setFilter(result!);
        },
      )
    ]));
  }
}
