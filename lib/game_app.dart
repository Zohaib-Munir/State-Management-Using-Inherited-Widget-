import 'package:country_game_app/Provider.dart';
import 'package:country_game_app/countries.dart';
import 'package:country_game_app/main.dart';
import 'package:flutter/material.dart';

class GameApp extends StatefulWidget {
  const GameApp({super.key});

  @override
  State<GameApp> createState() => _GameAppState();
}

class _GameAppState extends State<GameApp> {
  int currentScore = 0;
  int attemptedQuestion = 0;
  bool showAnswer = false;

  void rightAnswer() {
    setState(() {
      if (attemptedQuestion < countriesAndCapitals.length - 1) {
        currentScore++;
        attemptedQuestion++;
      }
    });
  }

  void wrongAnswer() {
    setState(() {
      if (attemptedQuestion < countriesAndCapitals.length - 1) {
        attemptedQuestion++;
      }
    });
  }

  void resetGame() {
    setState(() {
      currentScore = 0;
      attemptedQuestion = 0;
    });
  }

  void answerFlag() {
    setState(() {
      showAnswer = !showAnswer;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Provider(
      currentScore: currentScore,
      attemptedQuestion: attemptedQuestion,
      showAnswer: showAnswer,
      rightAnswer: rightAnswer,
      wrongAnswer: wrongAnswer,
      resetGame: resetGame,
      answerFlag: answerFlag,
      child: const MyApp(),
    );
  }
}
