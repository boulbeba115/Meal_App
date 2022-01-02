import 'package:flutter/material.dart';
import '../models/meal.dart';
import 'package:meal_app/widget/meal_item.dart';

class CatagoryMealsScreen extends StatefulWidget {
  static const routeName = '/categor-meals';
  final List<Meal> availableMeals;

  const CatagoryMealsScreen({
    required this.availableMeals,
    Key? key,
  }) : super(key: key);

  @override
  State<CatagoryMealsScreen> createState() => _CatagoryMealsScreenState();
}

class _CatagoryMealsScreenState extends State<CatagoryMealsScreen> {
  late String categoryTitle;
  late List<Meal> displayedMeals;
  var _loadedInitData = false;
  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context)!.settings.arguments as Map<String, String>;
      final categroyId = routeArgs['id'];
      categoryTitle = routeArgs['title'] as String;
      /*displayedMeals = DUMMY_MEALS
          .where((meal) => meal.categories.contains(categroyId))
          .toList();*/
      displayedMeals = widget.availableMeals
          .where((meal) => meal.categories.contains(categroyId))
          .toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  void _removeMeal(String id) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            meal: displayedMeals[index],
            removeItem: _removeMeal,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
