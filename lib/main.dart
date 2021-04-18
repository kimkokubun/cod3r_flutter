import 'package:cod3r_refeicao_app/data/dummy_data.dart';
import 'package:cod3r_refeicao_app/models/meal.dart';
import 'package:cod3r_refeicao_app/models/settings.dart';
import 'package:cod3r_refeicao_app/screens/categories_meals_screen.dart';
import 'package:cod3r_refeicao_app/screens/categorys_screen.dart';
import 'package:cod3r_refeicao_app/screens/meal_detail_screen.dart';
import 'package:cod3r_refeicao_app/screens/settings_screen.dart';
import 'package:cod3r_refeicao_app/screens/tabs_screen.dart';
import 'package:cod3r_refeicao_app/utils/app_routes.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> _avaiableMeals = DUMMY_MEALS;
  Settings settings = Settings();

  void _filterMeals(Settings settings) {
    setState(() {
      this.settings = settings;

      _avaiableMeals = DUMMY_MEALS.where((meal) {
        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filterVegeterian = settings.isVegetarian && !meal.isVegetarian;
        return !filterGluten &&
            !filterLactose &&
            !filterVegan &&
            !filterVegeterian;
      }).toList();
    });
  }

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
        AppRoutes.CATEGORIES_MEALS: (ctx) =>
            CategoriesMealsScreen(_avaiableMeals),
        AppRoutes.MEAL_DETAILS: (ctx) => MealDetailScreen(),
        AppRoutes.SETTINGS: (ctx) => SettingsScreen(settings, _filterMeals),
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
