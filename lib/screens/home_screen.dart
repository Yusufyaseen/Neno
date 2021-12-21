import 'package:childs/utilities/hangman_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import './game_screen.dart';

// import 'package:flutter_hangman/components/action_button.dart';
// import 'package:flutter_hangman/utilities/hangman_words.dart';
// import 'game_screen.dart';
// import 'loading_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final HangmanWords hangmanWords = HangmanWords();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    hangmanWords.readWords();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        children: <Widget>[
          Center(
            child: Container(
              margin: const EdgeInsets.fromLTRB(8.0, 1.0, 8.0, 8.0),
              child: Text(
                'HANGMAN',
                style: TextStyle(
                    color: Colors.amber[800],
                    fontSize: 58.0,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 3.0),
              ),
            ),
          ),
          Center(
            child: Image.asset(
              'images/gallow.png',
              height: height * 0.49,
            ),
          ),
          const SizedBox(
            height: 15.0,
          ),
          Center(
            child: IntrinsicWidth(
              stepWidth: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () =>
                        Get.to(() => GameScreen(hangmanObject: hangmanWords)),
                    child: const Text(
                      "Start",
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(10),
                      primary: Colors.amber,
                      elevation: 0,
                      fixedSize: const Size(150, 60),
                    ),
                  ),
                  const SizedBox(
                    height: 18.0,
                  ),
                  // ElevatedButton(
                  //   onPressed: () {},
                  //   child: const Text(
                  //     "High Score",
                  //     style: TextStyle(fontSize: 30, color: Colors.white),
                  //   ),
                  //   style: ElevatedButton.styleFrom(
                  //     padding: const EdgeInsets.all(10),
                  //     primary: Colors.amber,
                  //     elevation: 0,
                  //     fixedSize: const Size(150, 60),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
