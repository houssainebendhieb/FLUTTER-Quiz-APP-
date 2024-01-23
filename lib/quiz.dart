import 'package:challenge1/final_screen.dart';
import 'package:flutter/material.dart';
import 'package:challenge1/start_screen.dart';
import 'package:challenge1/question_screen.dart';
import 'package:challenge1/data/questions.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> Answers = [];

  void restartQuiz() {
    setState(() {
      Answers = [];
      activeScreen = QuestionScreen(addAnswer);
    });
  }

  void addAnswer(String answer) {
    Answers.add(answer);
    if (Answers.length == questions.length) {
      setState(() {
        activeScreen = final_screen(Answers,restartQuiz);
      });
    }
  }

  Widget? activeScreen;
  @override
  void initState() {
    activeScreen = StartScreen(changeWidget);
    super.initState();
  }

  void changeWidget() {
    setState(() {
      activeScreen = QuestionScreen(addAnswer);
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
        home: Scaffold(
      body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurple, Colors.blue],
            ),
          ),
          child: activeScreen),
    ));
  }
}
