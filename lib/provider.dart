import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Provider extends InheritedWidget {
  final int currentScore;
  final int attemptedQuestion;
  final bool showAnswer;
  final VoidCallback rightAnswer;
  final VoidCallback wrongAnswer;
  final VoidCallback resetGame;
  final VoidCallback answerFlag;

  const Provider({
    Key? key,
    required Widget child,
    required,
    required this.currentScore,
    required this.attemptedQuestion,
    required this.showAnswer,
    required this.rightAnswer,
    required this.wrongAnswer,
    required this.resetGame,
    required this.answerFlag,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant Provider oldWidget) {
    print("updateShouldNotify");
    return oldWidget.currentScore != currentScore ||
        oldWidget.attemptedQuestion != attemptedQuestion ||
        oldWidget.showAnswer != showAnswer;
  }

  static Provider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Provider>();
  }
}
