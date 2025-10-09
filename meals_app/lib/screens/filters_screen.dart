import 'package:flutter/material.dart';
import 'package:meals_app/widgets/switch_list_tile_filter.dart';

enum Filter { glutenFree, lactoseFree, vegetarian, vegan }

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFreeFilteredSet = false;
  var _lactoseFilteredSet = false;
  var _vegetarianFilteredSet = false;
  var _veganFilteredSet = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your filters')),
      // ignore: deprecated_member_use
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            Filter.glutenFree: _glutenFreeFilteredSet,
            Filter.lactoseFree: _lactoseFilteredSet,
            Filter.vegetarian: _vegetarianFilteredSet,
            Filter.vegan: _veganFilteredSet,
          });
          return false;
        },
        child: Column(
          children: [
            FilterSwitchListTile(
              value: _glutenFreeFilteredSet,
              mealType: 'Gluten free',
            ),
            FilterSwitchListTile(
              value: _lactoseFilteredSet,
              mealType: 'Lactose free',
            ),
            FilterSwitchListTile(
              value: _vegetarianFilteredSet,
              mealType: 'Vegetarian',
            ),
            FilterSwitchListTile(value: _veganFilteredSet, mealType: 'Vegan'),
          ],
        ),
      ),
    );
  }
}
