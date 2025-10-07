import 'package:flutter/material.dart';
import 'package:meals_app/models/category.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({super.key, required this.category, required this.onSelectScreen});

  final Category category;
  final void Function() onSelectScreen;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelectScreen,
      splashColor: Theme.of(context).colorScheme.primary,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            colors: [
              category.color.withAlpha((0.4 * 255).toInt()),
              category.color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight
          )
        ),
        child: Text(category.title, style: Theme.of(context).textTheme.titleLarge!.copyWith(
          color: Theme.of(context).colorScheme.onSurface,
        ),),
      ),
    );
  }
}