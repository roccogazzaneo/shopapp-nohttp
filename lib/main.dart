import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/category.dart';
import './screens/meal_detail_screen.dart';
import './screens/categories_screen.dart';
import './screens/category_meals_screen.dart';

void main() => runApp(MaterialApp(home: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              bodyText2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              caption: TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold))),
      // home is the what is loaded as first screen in the app
      home: CategoriesScreen(),
      // routes table to facilitate navigating if too many navigations
      // just slash is the home by default.
      initialRoute: '/', // if you want to change the default
      routes: {
        // but input of the constructor are not in the main.dart
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
      },
      // if some strange navigation occurs display this
      onGenerateRoute: (settings) {
        print(settings.arguments);
        // you can make if statements and return different things
        // and run your own logic
        // this is useful because if you delete above the line of
        // Mealdetailscreen then you are back to the categories screen
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
      onUnknownRoute: (settings) {
        // when flutter fails to build any screen defined above,
        // to provide a fall back on the screen
        // like a 404 page not found error
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
    );
  }
}
