// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:meals_app/data/category_class.dart';

class CategoryCard extends StatelessWidget {
  CategoryCard({super.key, required this.item, required this.selectedCategory});

  final Category item;
  void Function(String select, String title) selectedCategory;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {selectedCategory(item.id, item.title)},
      splashColor: Theme.of(context).colorScheme.primary,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              item.color.withOpacity(0.5),
              item.color.withOpacity(0.9)
            ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
            borderRadius: BorderRadius.circular(12)),
        child: Text(
          item.title,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
      ),
    );
  }
}
