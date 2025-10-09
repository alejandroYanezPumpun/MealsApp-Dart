import 'package:flutter/material.dart';

class FilterSwitchListTile extends StatefulWidget {
  const FilterSwitchListTile({super.key, required this.value, required this.mealType});

  final bool value;
  final String mealType;

  @override
  State<FilterSwitchListTile> createState() => _FilterSwitchListTileState();
}

class _FilterSwitchListTileState extends State<FilterSwitchListTile> {
  late bool _currentValue;

  @override
  void initState() {
    super.initState();
    _currentValue = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: _currentValue,
      onChanged: (isChecked) {
        setState(() {
          _currentValue = isChecked;
        });
      },
      title: Text(
        widget.mealType,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
      subtitle: Text(
        'Only include ${ widget.mealType} meals',
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
      activeColor: Theme.of(context).colorScheme.tertiary,
      contentPadding: EdgeInsets.only(left: 34, right: 22),
    );
  }
}