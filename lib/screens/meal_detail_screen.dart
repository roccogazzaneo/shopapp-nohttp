import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    // every widget that you use a standalone and that navigates with
    // a navigator needs a SCaffold
    return Scaffold(
      appBar: AppBar(title: Text("Title")),
      body: Center(
        child: Text("The meal - $mealId"),
      ),
    );
  }
}
