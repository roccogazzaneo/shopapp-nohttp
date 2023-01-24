// one widget per file as convention
// type st and you will have prebuildt widgets

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Question extends StatelessWidget {
  // final tells that once the constructor is called, once the object
  // is live we cannot reassign a new value to the questionText
  // at the point it executes we lock final values, but while writing
  // we dont know what the value would be
  // CONST VS FINAL
  final String questionText;

  // you can go with a positional argument without curly brackets because
  // you dont need so
  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    // container is used for styling (the padding) around the child (text)
    // also it will format the border (colors) and the marging containing
    // everything
    return Container(
        width: double.infinity, // to say as much as possible
        margin: EdgeInsets.all(10),
        child: Text(
          questionText,
          style: TextStyle(fontSize: 28),
          // it will not recenter because of space - add a container
          // ctrl click to learn about the function
          // you can create other object as subobjects by using .
          // in that way you can prespecify arguments (veryOld 2.41)
          textAlign: TextAlign.center,
        ));
  }
}
