import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart'; // for datetime formatting

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  // this below constructor is about how to pass data to small widget
  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    // this container is to tell the element to not take as much as space
    // as he wants, so you should wrap a listview in a container
    return Container(
        height: 300,
        // a list view is a widget with infinite height unlike a column
        // that takes all available column

        // builder does not render everything, returns the card
        child: ListView.builder(
            itemBuilder: (ctx, index) {
              // Card contiene row. Row contiene un Container, e una colonna con due testi
              return Card(
                child: Row(children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 15,
                    ),
                    // draw a border in all directions
                    decoration: BoxDecoration(
                        border: Border.all(
                      color: Colors.purple,
                      width: 2,
                    )),
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "\$${transactions[index].amount.toStringAsFixed(2)}",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.purple),
                    ),
                  ),
                  Column(children: <Widget>[
                    Text(transactions[index].title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.black)),
                    // you can add a dot after dateformat for special constructors
                    Text(
                        DateFormat('yyyy-MM-dd')
                            .format(transactions[index].date),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Colors.grey)),
                  ], crossAxisAlignment: CrossAxisAlignment.start)
                ]),
              );
            },
            itemCount: transactions.length));
  }
}
