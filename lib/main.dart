import 'package:cod3r_refeicao_app/screens/categories_meals_screen.dart';
import 'package:cod3r_refeicao_app/screens/categorys_screen.dart';
import 'package:cod3r_refeicao_app/screens/meal_detail_screen.dart';
import 'package:cod3r_refeicao_app/screens/tabs_screen.dart';
import 'package:cod3r_refeicao_app/utils/app_routes.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          fontFamily: 'Raleway',
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          textTheme: ThemeData.light().textTheme.copyWith(
              headline6:
                  TextStyle(fontSize: 20, fontFamily: 'RobotoCondensed'))),
      routes: {
        AppRoutes.HOME: (ctx) => TabsScreen(),
        AppRoutes.CATEGORIES_MEALS: (ctx) => CategoriesMealsScreen(),
        AppRoutes.MEAL_DETAILS: (ctx) => MealDetailScreen()
      },
      //caso nao houver rotas retorna para o CategoriesScreen
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (_) {
          return CategoriesScreen();
        });
      },
    );
  }
}
