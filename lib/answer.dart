// Raised Button does not necessary has to be in stateful widget.
// we can also trigger a function even if it lives in a separate widget
// manage the answer in the answer - and question in question - respectively

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Answer extends StatelessWidget {
  // Answer takes a function as input because he will use it
  // to display a button that will trigger that function
  // VoidCallback means that it will accept a function that
  // wont take anything as input and wont return anything
  // in other cases use function
  final VoidCallback selectHandler;
  final String answerText;
  Answer(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child:
            ElevatedButton(child: Text(answerText), onPressed: selectHandler));
  }
}
