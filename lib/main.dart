import 'package:flutter/material.dart';

import './quiz.dart'; // this would import all widgets unless
import '/result.dart';

// they have an underscore

void main() => runApp(MyApp());

// sometimes you wanna call certain classes only from certain files
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // to connect the 2 pieces (the class below)
    return _MyAppState();
  }
}

// the underscore will make the class into private so it can be only used
// in this file, same for variables and functions
class _MyAppState extends State<MyApp> {
  static const _questions = [
    // should contain also info about answers - use maps (dict)
    {
      'questionText': 'What is the best course to learn Flutter?',
      'answers': [
        {'text': 'Udemy', 'score': 10},
        {'text': 'TheBrewery', 'score': 1},
      ],
    },
    {
      'questionText': 'Who is the best student?',
      'answers': [
        {'text': 'Rocco', 'score': 15},
        {'text': 'Nicco', 'score': 1},
      ],
    },
    {
      'questionText': 'How much money are you going to make',
      'answers': [
        {'text': '5 euros', 'score': 1},
        {'text': '5000 euros', 'score': 1},
        {'text': '5m euros', 'score': 1},
        {'text': '5bn euros', 'score': 1}
      ],
    }
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    // reset
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    // this setState is necessary because the app does not reinder
    // everyime you touch a button. SetState is an indicator that we are
    // about to change the state

    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    }
  } // you cannot assign a string variable the null (NULL SAFETY)

  @override
  Widget build(BuildContext context) {
    // you use const because it is compiled time constant.
    // you know that this value will never change ever

    // reassigning variables does not work if question is a constant
    // if value is a constant instead, you cannot modify the list in place
    // it becomes an unmutable object
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('My first app')),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions)
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
