import 'package:flutter/material.dart';

class CatagoryMealsScreenMethod1 extends StatelessWidget {
  final String categoryId;
  final String categoryTitle;

  const CatagoryMealsScreenMethod1({
    required this.categoryId,
    required this.categoryTitle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('The Recipes'),
      ),
      body: const Center(
        child: Text('The recipes meals Page'),
      ),
    );
  }
}
