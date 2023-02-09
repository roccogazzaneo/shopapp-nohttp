import '../providers/products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
  // final String title;
  // we don't have the price.. so?
  // we would need to add data in the product main page that we would not use
  // final double price;
  // ProductDetailScreen(this.title, this.price);

  static const routeName = '/product-detail';
  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String;
    // if listen is true then the build method of widget in which you are using provider of will re run
    // whenever the Products object changes
    final loadedProduct =
        Provider.of<Products>(context, listen: false).findById(productId);
    return Scaffold(
        appBar: AppBar(
          title: Text(loadedProduct.title),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                  height: 300,
                  width: double.infinity,
                  child:
                      Image.network(loadedProduct.imageUrl, fit: BoxFit.cover)),
              SizedBox(height: 10),
              Text(
                '\$${loadedProduct.price}',
                style: TextStyle(color: Colors.grey, fontSize: 20),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                width: double.infinity,
                child: Text(
                  '${loadedProduct.description}',
                  textAlign: TextAlign.center,
                  softWrap: true,
                ),
              ),
            ],
          ),
        ));
  }
}
