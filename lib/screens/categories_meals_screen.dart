import 'package:cod3r_refeicao_app/components/meal_item.dart';
import 'package:cod3r_refeicao_app/data/dummy_data.dart';
import 'package:cod3r_refeicao_app/models/category.dart';
import 'package:flutter/material.dart';

class CategoriesMealsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context).settings.arguments as Category;
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();

    return Scaffold(
      appBar: AppBar(title: Text(category.title)),
      body: ListView.builder(
          itemCount: categoryMeals.length,
          itemBuilder: (ctx, index) {
            return MealItem(categoryMeals[index]);
          }),
    );
  }
}