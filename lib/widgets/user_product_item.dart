import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../widgets/user_product_item.dart';
import 'package:flutter/material.dart';

class UserProductItem extends StatelessWidget {
  final String title;
  final String imageUrl;

  UserProductItem(this.title, this.imageUrl);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
      ),
      trailing: Row(children: <Widget>[
        IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {},
            color: Theme.of(context).primaryColor),
        IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {},
            color: Theme.of(context).errorColor),
      ]),
    );
  }
}
