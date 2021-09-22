import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../models/meal.dart';
import '../screen/filters_screen.dart';

import '../screen/tabs_screen.dart';
import '../screen/meal_detail_screen.dart';
import '../screen/category_meals_screen.dart';

void main() {
  runApp(const MyHomePage());
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'Vegan': false,
    'Vegetarian': false,
  };
    List<Meal> _availableMeals =DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];
  void _setFilters(Map<String, bool> _filtersData) {
    setState(() {
      _filters = _filtersData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if(_filters['gluten']==true && meal.isGlutenFree==false) {
          return false;
        }
        if(_filters['lactose']==true && meal.isLactoseFree==false) {
          return false;
        }
        if(_filters['Vegan']==true && meal.isVegan==false) {
          return false;
        }
        if(_filters['Vegetarian']==true && meal.isVegetarian==false) {
          return false;
        }
        return true;

      }).toList();
    });
  }
  
  void _toggleFavorites(String mealId){
    final existingIndex = _favoriteMeals.indexWhere((meal) => meal.id== mealId);
    if(existingIndex>=0){
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    }
    else{
      _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
    }

  }
  bool isMealFavorite(String id){

    return _favoriteMeals.any((meal) => meal.id== id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meal App',
      theme: ThemeData(
        primaryColor: Colors.pink,
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1: const TextStyle(
              color: Color.fromRGBO(20, 50, 50, 1),
            ),
            bodyText2: const TextStyle(
              color: Color.fromRGBO(20, 50, 50, 1),
            ),
            headline4: const TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold)),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink)
            .copyWith(secondary: Colors.amber),
      ),
      routes: {
        '/': (context) => TabsScreen(_favoriteMeals),
        FiltersScreen.routeName: (context) => FiltersScreen( _filters ,_setFilters),
        MealDetailScreen.routeName: (context) =>  MealDetailScreen(_toggleFavorites,isMealFavorite),
        CategoryMealsScreen.routeName: (context) => CategoryMealsScreen(_availableMeals),
      },
    );
  }
}
