import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/product_item.dart';
import '../providers/products.dart';

class ProductsGrid extends StatelessWidget {
  final bool showFavs;

  ProductsGrid(this.showFavs);
  // the build method of a parent of this (Overview screen) will not listen
  @override
  Widget build(BuildContext context) {
    // I wanna listen to changes in PRODUCTS. It goes up and up and up until it finds a provider
    // which thankfully gives an instance of type PRODUCTS
    final productsData = Provider.of<Products>(context);
    final products = showFavs ? productsData.favoriteItems : productsData.items;
    return GridView.builder(
      // structure of the build
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
      // how every grid cells is built

      // .value makes sure that provider changes when the data changes
      // all scenarios where you have list items - with builder functions will create bugs for widgets
      // that go beyound boundaries

      // ChangeNotifier cleans memory for you
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: products[i],
        child: ProductItem(
            //products[i].id,
            //products[i].title,
            // products[i].imageUrl,
            ),
      ),
      // const performance
      padding: const EdgeInsets.all(10.0),
      itemCount: products.length,
    );
  }
}
