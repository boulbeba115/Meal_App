import 'package:flutter/material.dart';
import '../data/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const String routeName = "/meal-detail";
  final Function toggleFavorite;
  final Function isMealFavorite;
  const MealDetailScreen({
    required this.toggleFavorite,
    required this.isMealFavorite,
    Key? key,
  }) : super(key: key);

  Widget buildSectionWidget(BuildContext context, String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline1,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget buildContainer(BuildContext context, Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: 250,
      width: 350,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionWidget(context, 'Ingredients'),
            buildContainer(
              context,
              ListView.builder(
                itemBuilder: (context, index) => Card(
                  color: Colors.white70,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Text(selectedMeal.ingredients[index]),
                  ),
                ),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            buildSectionWidget(context, 'Steps'),
            buildContainer(
              context,
              ListView.builder(
                itemBuilder: (context, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('# ${index + 1}'),
                      ),
                      title: Text(
                        selectedMeal.steps[index],
                      ),
                    ),
                    const Divider(),
                  ],
                ),
                itemCount: selectedMeal.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        onPressed: () => toggleFavorite(mealId),
        child: isMealFavorite(mealId)
            ? Icon(Icons.favorite)
            : Icon(Icons.favorite_border),
      ),
    );
  }
}
