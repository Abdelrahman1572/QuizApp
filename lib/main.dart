import 'package:flutter/material.dart';
import 'result.dart';
import 'quiz.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

bool isSwitched = false;

class _MyAppState extends State<MyApp> {
  int _questionIndex = 0;
  int _totalScore = 0;

  answerQuestion(int score) {
    print('Answer Chosen!');
    setState(() {
      _questionIndex += 1;
      _totalScore += score;
    });
    print(_questionIndex);
    print(_totalScore);
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  final List<Map<String, Object>> _questions = [
    {
      'questionText': 'Who invented C++?',
      'answers': [
        {'text': ' Dennis Ritchie', 'score': 10},
        {'text': 'Ken Thompson', 'score': 20},
        {'text': 'Brian Kernighan', 'score': 30},
        {'text': ' Bjarne Stroustrup', 'score': 40},
      ]
    },
    {
      'questionText': 'Which of the following is a correct identifier in C++?',
      'answers': [
        {'text': 'VAR_1234', 'score': 40},
        {'text': '#var_name', 'score': 20},
        {'text': ' 7VARNAME', 'score': 30},
        {'text': ' 7var_name', 'score': 10},
      ]
    },
    {
      'questionText': 'Which of the following is not a type of Constructor in C++?',
      'answers': [
        {'text': 'Default constructor', 'score': 10},
        {'text': 'Parameterized constructor', 'score': 20},
        {'text': 'Copy constructor', 'score': 30},
        {'text': 'Friend constructor', 'score': 40},
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Quiz App',
            style: TextStyle(
                color: isSwitched == false ? Colors.white : Colors.black),
          ),
          actions: [
            Switch(
              value: isSwitched,
              onChanged: (value) {
                setState(() {
                  isSwitched = value;
                });
              },
              activeColor: Colors.white,
              inactiveThumbColor: Colors.black,
              inactiveTrackColor: Colors.black,
            ),
          ],
        ),
        body: Container(
          color: isSwitched == false ? Colors.white : Colors.black,
          child: _questionIndex < _questions.length
              ? Quiz(_questions, _questionIndex, answerQuestion)
              : Result(_resetQuiz, _totalScore),
        ),
      ),
    );
  }
}
