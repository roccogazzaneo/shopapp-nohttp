import '../screens/category_meals_screen.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem(this.id, this.title, this.color);

  void selectCategory(BuildContext ctx) {
    // context lets you know what the current screen is, to add screen on top
    // push is to add a new page
    // push & replace, is to add a new page and remove it the one below, so you wont
    // be able to go back

    // push named is to use the route attribute in the main.dart without
    // passing input to the constructor
    // routeName is to avoid to use the path
    Navigator.of(ctx).pushNamed(CategoryMealsScreen.routeName, arguments: {
      'id': id,
      'title': title,
    });
  }

  @override
  Widget build(BuildContext context) {
    // gesture detector or InkWell is to run a function when a user taps
    // pass the context to the navigator
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      // border radius should be the same as down
      borderRadius: BorderRadius.circular(15),
      child: Container(
        // const to be faster
        padding: const EdgeInsets.all(15),
        child: Text(title, style: Theme.of(context).textTheme.titleMedium),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                color.withOpacity(0.7),
                color,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
