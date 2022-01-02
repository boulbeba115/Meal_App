import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widget/meal_item.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;
  const FavoriteScreen({required this.favoriteMeals, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return const Center(
        child: Text('You have no favorite meals ! try to add some'),
      );
    }
    return ListView.builder(
      itemBuilder: (ctx, index) {
        return MealItem(
          meal: favoriteMeals[index],
          removeItem: () {},
        );
      },
      itemCount: favoriteMeals.length,
    );
  }
}
