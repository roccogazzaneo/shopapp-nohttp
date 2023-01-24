import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);
  // getter cannot take argument
  String get resultPhrase {
    var resultText = 'WRONG ANSWERS BITCH!';
    if (resultScore > 5) {
      resultText = 'YOU PASSED THE TEST!';
    } else {
      resultText = 'You are so bad!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      // you can WRAP with COLUMN automatically
      // a column by default
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          // initially a flatbutton
          FloatingActionButton(
            child: Text('Restart Quiz!'),
            onPressed: resetHandler,
          )
        ],
      ),
    );
  }
}
