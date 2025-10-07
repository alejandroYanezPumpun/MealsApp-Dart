import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meal_details_screen.dart';
import 'package:meals_app/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.meals, required this.title});

  void _selectMeal(BuildContext context, Meal meal) {

    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (ctx) => MealDetailsScreen(meal: meal,)));
  }

  final String title;
  final List<Meal> meals;
  @override
  Widget build(BuildContext context) {
    Widget body = ListView.builder(
      itemBuilder:
          (ctx, index) => MealItemWidget(
            meal: meals[index],
            onSelectMeal: () {
              _selectMeal(context, meals[index]);
            },
          ),
      itemCount: meals.length,
    );

    if (meals.isEmpty) {
      body = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Uh oh... nothing here!',
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Try selecting a different category',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ],
        ),
      );
    }
    return Scaffold(appBar: AppBar(title: Text(title)), body: body);
  }
}
