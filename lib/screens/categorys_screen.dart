import 'package:cod3r_refeicao_app/components/category_item.dart';
import 'package:cod3r_refeicao_app/data/dummy_data.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(25),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children:
          DUMMY_CATEGORIES.map((categorie) => CategoryItem(categorie)).toList(),
    );
  }
}
