import '../widgets/category_item.dart';
import '../dummy_data.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // grid view as list view (also has a builder to optimize)
    // map list of data into list of widgets
    // also, the screen cannot only be the gridview, but also appbar ecc
    // this is why you add scaffold
    return Scaffold(
      appBar: AppBar(title: const Text('DeliMeal')),
      body: GridView(
        padding: const EdgeInsets.all(25),
        children: DUMMY_CATEGORIES
            .map((cat) => CategoryItem(cat.id, cat.title, cat.color))
            .toList(),
        // preconfigured class that gives maximum width and length
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          // height and width relationship
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      ),
    );
  }
}
