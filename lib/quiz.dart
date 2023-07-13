import 'package:flutter/material.dart';

import 'package:quiz/start_screen.dart';
import 'package:quiz/questions_screen.dart';
import 'package:quiz/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  final List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length > 6) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  void resetQuiz() {
    setState(() {
      activeScreen = 'start-screen';
      selectedAnswers.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);
    if (activeScreen == 'question-screen') {
      screenWidget = QuestionScreen(chooseAnswer);
    } else if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(selectedAnswers, resetQuiz);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 4, 4, 24),
                Color.fromARGB(255, 11, 11, 61)
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
