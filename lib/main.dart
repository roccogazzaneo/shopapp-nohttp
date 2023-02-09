import 'package:flutter/material.dart';
import './screen/product_overview_screen.dart';
import './screen/product_detail_screen.dart';
import './providers/products.dart';
import 'package:provider/provider.dart';
import './providers/cart.dart';
import '../screen/cart_screen.dart';
import '../screen/user_product_screen.dart';
import './providers/orders.dart';

// Managing Data & User Interface. If data changes, UI changes.
// State is the data which affects the UI and which might change over time

// App-wide state affects entire large chunk of the app (Authentication state -  is user logged in?)
// Widget Local State - State that affects only one Widgets (should you display a loading spinner?)

// Provider package: a global data provider which you attach to a widget (can be any widget).
// All child widget son of that widget can listen to it (with of context). If data changes in provider A
// changes it will reload only on the widget that set up the listener on that provider A
// You can also have different listeners on the same provider, because you have different children.

// you need to provide a class at the highest possible widgets. If ProductOverviewScreen are interested
// in the data you need to provide them in a widget above them (MyApp). If Only to product item
// then you can give in the product oveview

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            // only children will be rebuilt not MATERIAL APP
            // here is better create - whenever you create a new object of the class create is more efficient
            create: (ctx) => Products()),
        ChangeNotifierProvider(
            // only children will be rebuilt not MATERIAL APP
            // here is better create - whenever you create a new object of the class create is more efficient
            create: (ctx) => Cart()),
        ChangeNotifierProvider(
            // only children will be rebuilt not MATERIAL APP
            // here is better create - whenever you create a new object of the class create is more efficient
            create: (ctx) => Orders()),
      ],
      child: MaterialApp(
          title: 'MyShop',
          theme: ThemeData(
            primarySwatch: Colors.purple,
            accentColor: Colors.deepOrange,
            fontFamily: "RobotoCondensed",
          ),
          home: ProductOverviewScreen(),
          routes: {
            ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
            CartScreen.routeName: (ctx) => CartScreen(),
            UserProductsScreen.routeName: (ctx) => UserProductsScreen(),
          }),
    );
  }
}
