import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screen/user_product_screen.dart';
import '../widgets/products_grid.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';
import '../widgets/badge.dart';
import '../providers/cart.dart';
import '../screen/cart_screen.dart';

// if stored offline then always available without internet but only available for user
// you have to store it in a webserver
// you dont connect flutter to database because insecure - in your flutter you would need
// to include DB credentials in flutter code which could potentially crackable when you deploy to
// the appstore - SO YOU CONNECT IT TO A WEBSERVER (firebase)

// Rest API common web server for front end application like flutter app
// send http request made of endpoint(url) + http verb to a server and depending on the combination
// an anction occurs.

// http verb is the type of request: GET (when you open a web page - data is sent to the browser
// via a get request);
// POST - store data into server, add data to existing list.
// PATCH - updates data/ PUT replaces data
// DELETE -

enum FilterOptions { Favorites, All }

class ProductOverviewScreen extends StatefulWidget {
  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  var _showOnlyFavorites = false;
  @override
  Widget build(BuildContext context) {
    // call listen:False when you are only interested about productsContainer
    // this is only if you want a filter for your whole application
    // final productsContainer = Provider.of<Products>(context, listen: false);
    // if it will be a full screen then it must be scaffold
    return Scaffold(
        appBar: AppBar(
          title: Text("MyShop"),
          actions: <Widget>[
            PopupMenuButton(
                icon: Icon(
                  Icons.more_vert,
                ),
                onSelected: (FilterOptions selectedValue) {
                  // like this the favorite state only affects the main page widget
                  setState(() {
                    if (selectedValue == FilterOptions.Favorites) {
                      _showOnlyFavorites = true;
                    } else {
                      _showOnlyFavorites = false;
                    }
                  });
                },
                itemBuilder: (_) => [
                      PopupMenuItem(
                          child: Text('Only Favorites'),
                          value: FilterOptions.Favorites),
                      PopupMenuItem(
                          child: Text('Show All'), value: FilterOptions.All),
                    ]),
            Consumer<Cart>(
              // cut the button out of badge inside consumer as child because you don't need
              // to rerun that every time you add an item. The icon button stays the same
              builder: (_, cart, ch) => Badge(
                child: ch,
                value: cart.itemCount.toString(),
              ),
              // this wont be rebuilt
              child: IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.of(context).pushNamed(CartScreen.routeName);
                },
              ),
            ),
          ],
        ),
        body: ProductsGrid(_showOnlyFavorites));
  }
}
