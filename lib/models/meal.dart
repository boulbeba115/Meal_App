enum Complexity {
  simple,
  challenging,
  hard,
}
enum Affordability {
  affordable,
  pricey,
  luxurious,
}

class Meal {
  final String id;
  final String title;
  final String imageUrl;
  final List<String> categories;
  final List<String> steps;
  final List<String> ingredients;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;

  const Meal({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.categories,
    required this.steps,
    required this.ingredients,
    required this.duration,
    required this.complexity,
    required this.affordability,
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.isVegan,
    required this.isVegetarian,
  });

  String get complexitText {
    switch (complexity) {
      case Complexity.simple:
        return 'Simple';
      case Complexity.hard:
        return 'Hard';
      case Complexity.challenging:
        return 'Challenging';
      default:
        return 'Unknown';
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.affordable:
        return 'Affordable';
      case Affordability.pricey:
        return 'Pricey';
      case Affordability.luxurious:
        return 'Luxurious';
      default:
        return 'Unknown';
    }
  }
}
