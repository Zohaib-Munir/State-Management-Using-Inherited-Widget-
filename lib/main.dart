import 'package:country_game_app/Provider.dart';
import 'package:country_game_app/countries.dart';
import 'package:country_game_app/custom_button.dart';
import 'package:country_game_app/game_app.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const GameApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFF8C794),
          foregroundColor: Colors.black,
          title: const Text(
            "Guess Captial",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Builder(
                builder: (context2) {
                  final provider = Provider.of(context2);

                  return Text(
                    "Scores : ${provider?.currentScore} / ${provider?.attemptedQuestion}",
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
              ),
              SizedBox(
                height: height * 0.25,
                width: width,
                child: Card(
                  shadowColor: Colors.grey,
                  elevation: 10,
                  color: const Color(0xFFFFE0B5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Builder(
                        builder: (context) {
                          print("Country And Capital Vala Text");
                          final provider = Provider.of(context)!;
                          return Text(
                            provider.showAnswer ? 'Country' : 'Capital',
                            style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        },
                      ),
                      Builder(
                        builder: (context) {
                          final provider = Provider.of(context)!;
                          return Text(
                            provider.showAnswer
                                ? countriesAndCapitals[
                                    provider.attemptedQuestion]['country']!
                                : countriesAndCapitals[
                                    provider.attemptedQuestion]['capital']!,
                            style: const TextStyle(
                              fontSize: 38,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
                width: MediaQuery.of(context).size.width,
              ),
              Builder(
                builder: (context) {
                  final provider = Provider.of(context)!;
                  return CustomButton(
                    title:
                        "Show ${provider.showAnswer ? "Answer" : "Question"}",
                    onPress: provider.answerFlag,
                    color: const Color(0xFF80AF81),
                  );
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
                width: MediaQuery.of(context).size.width,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Builder(
                    builder: (context) {
                      final provider = Provider.of(context)!;
                      return CustomButton(
                        title: "Right",
                        onPress: provider.rightAnswer,
                        color: Colors.lightGreen.shade900,
                      );
                    },
                  ),
                  Builder(
                    builder: (context) {
                      final provider = Provider.of(context)!;
                      return CustomButton(
                        title: "Wrong",
                        onPress: provider.wrongAnswer,
                        color: Colors.redAccent.shade700,
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
