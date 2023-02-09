import 'package:flutter/material.dart';
import '../providers/orders.dart';
import 'package:provider/provider.dart';
import '../widgets/order_item.dart' as ci;
import '../providers/orders.dart';

class OrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'),
      ),
      body: ListView.builder(
        itemCount: orderData.orders.length,
        itemBuilder: (ctx, i) => ci.OrderItem(orderData.orders[i]),
      ),
    );
  }
}
