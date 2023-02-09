import 'package:flutter/foundation.dart';

// if is favorite changes only certain interfaces of the product should change
// despite the fact that technically the whole product is changing
class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  // if you have an image as an asset then you would need to
  //restore the app everytime you have a new prodcuct
  bool isFavorite;

  Product(
      {@required this.id,
      @required this.title,
      @required this.description,
      @required this.price,
      @required this.imageUrl,
      this.isFavorite = false});

  void toggleFavoriteStatus() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
