import 'package:cod3r_refeicao_app/models/category.dart';
import 'package:cod3r_refeicao_app/screens/categories_meals_screen.dart';
import 'package:cod3r_refeicao_app/utils/app_routes.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  CategoryItem(this.category);

  void _selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(AppRoutes.CATEGORIES_MEALS, arguments: category);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        child:
            Text(category.title, style: Theme.of(context).textTheme.headline6),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(colors: [
            category.color.withOpacity(0.5),
            category.color,
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
      ),
    );
  }
}
