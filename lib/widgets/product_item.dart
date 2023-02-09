import '../screen/product_detail_screen.dart';
import 'package:flutter/material.dart';
import '../providers/product.dart';
import '../providers/products.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';

// Listener to a single product this time (only for favorite)

class ProductItem extends StatelessWidget {
  // final String id;
  // final String title;
  // final String imageUrl;

  // ProductItem(this.id, this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    // if you use Provider of, build will change everytime <Product> changes
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    print('product rebuilds'); // mention data that you wanna consume

    // if you want only to rerun a subpart of your widget tree whenever product
    // changes you can wrap it into a consumer widget. For example you could put
    // Consumer down there at the Icon only - in that case use Provider of with listen false
    //
    // if you want to change only a local widget you should change it into a stateful one
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: product.id,
            );
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: Consumer<Product>(
            builder: (context, value, _) => IconButton(
              icon: Icon(
                  product.isFavorite ? Icons.favorite : Icons.favorite_border),
              onPressed: () {
                product.toggleFavoriteStatus();
              },
              color: Theme.of(context).accentColor,
            ),
            // child in the consumer is the data in the subwidget that never changes
          ),
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.shopping_cart,
            ),
            onPressed: () {
              cart.addItem(product.id, product.price, product.title);
              // info after you pressed the button - SNACKBAR
              // can also add an action with pressed where you undo the action
              // can also use hide current snakcbar if you do 2 quickly.
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Added item to cart"),
              ));
            },
            color: Theme.of(context).accentColor,
          ),
        ),
      ),
    );
  }
}
