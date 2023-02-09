import 'package:flutter_complete_guide/widgets/user_product_item.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';
import 'package:flutter/material.dart';

class UserProductsScreen extends StatelessWidget {
  static const routeName = '/user_products';
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    // this will rebuild all so you can Consumer or you just USE CONST to avoid that some rerun
    return Scaffold(
        appBar: AppBar(
          title: const Text("Your products"),
          actions: <Widget>[
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.add),
            )
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(8),
          child: ListView.builder(
            itemBuilder: (_, i) => UserProductItem(
                productsData.items[i].title, productsData.items[i].imageUrl),
            itemCount: productsData.items.length,
          ),
        ));
  }
}
