import 'package:flutter/material.dart';
import 'package:meals_app/data/filter.dart';

class FilterScreen extends StatefulWidget {
  FilterScreen({super.key, required this.currentFilter});
  final currentFilter;

  @override
  State<FilterScreen> createState() {
    return _FilterScreen();
  }
}

class _FilterScreen extends State<FilterScreen> {
  late bool _valueGlten;
  late bool _valueLactose;
  late bool _valueVegatarian;
  late bool _valueVegan;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _valueGlten = widget.currentFilter[mealsType.isGlutenFree];
    _valueLactose = widget.currentFilter[mealsType.isLactoseFree];
    _valueVegatarian = widget.currentFilter[mealsType.isVegetarian];
    _valueVegan = widget.currentFilter[mealsType.isVegan];
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop({
          mealsType.isGlutenFree: _valueGlten,
          mealsType.isVegan: _valueVegan,
          mealsType.isVegetarian: _valueVegatarian,
          mealsType.isLactoseFree: _valueLactose,
        });
        return true;
      },
      child: Scaffold(
        appBar: AppBar(title: const Text("Your Filters")),
        body: Column(
          children: [
            SwitchListTile(
              subtitle: Text(
                'Only Include Gluten-Free Meals',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              title: Text(
                'Gluten-Free',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              value: _valueGlten,
              onChanged: (value) => setState(() {
                _valueGlten = value;
              }),
            ),
            SwitchListTile(
              subtitle: Text(
                'Only Include Lactose-Free Meals',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              title: Text(
                'Lactose-Free',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              value: _valueLactose,
              onChanged: (value) => setState(() {
                _valueLactose = value;
              }),
            ),
            SwitchListTile(
              subtitle: Text(
                'Only Include Vegatarian-Free Meals',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              title: Text(
                'Vegatarian-Free',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              value: _valueVegatarian,
              onChanged: (value) => setState(() {
                _valueVegatarian = value;
              }),
            ),
            SwitchListTile(
              subtitle: Text(
                'Only Include Vegan-Free Meals',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              title: Text(
                'Vegan-Free',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              value: _valueVegan,
              onChanged: (value) => setState(() {
                _valueVegan = value;
              }),
            )
          ],
        ),
      ),
    );
  }
}
