import 'package:flutter/material.dart';

// a new class for the card

class NewTransaction extends StatelessWidget {
  final Function addTx;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  // because you are passing add_new_transaction function as an argument
  NewTransaction(this.addTx);

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return; // return stops the function execution so it will not added
    }
    addTx(enteredTitle, enteredAmount);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      // wanna add margin to column? wrap it with a container
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            // text field to receive user inputs - ctrl space to see options
            // c'è una classe per tutto!!
            TextField(
              decoration: InputDecoration(labelText: "Title"),
              controller: titleController,
              onSubmitted: (_) => submitData,
              // for every key stroke onChanged:
              // needs to be a function that takes input and gives nothingù
              // this is how you assign the user input to the above chosen variable
              //onChanged: (val) {
              //  titleInput = val;
              //}
            ),
            TextField(
              decoration: InputDecoration(labelText: "Amount"),
              // use controller as alternative - much easier
              controller: amountController,
              // onChanged: (val) {
              //   amountInput = val;
              //}
              // to make sure you enter number
              keyboardType: TextInputType.number,
              // i get an argument but i don't care about it
              onSubmitted: (_) => submitData,
            ),
            ElevatedButton(
              child: Text('Add transaction'),
              // the function is what happens when you click the button
              onPressed: submitData,
            )
          ],
        ),
      ),
    );
  }
}
