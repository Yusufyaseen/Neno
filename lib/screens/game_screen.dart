import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/utils.dart';
import './home_screen.dart';
import 'package:get/get.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import '../utilities/alphabet.dart';
import '../utilities/constants.dart';
import '../utilities/hangman_words.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'dart:math';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

// import 'package:flutter_hangman/utilities/score_db.dart' as score_database;
// import 'package:flutter_hangman/utilities/user_scores.dart';

class GameScreen extends StatefulWidget {
  final HangmanWords hangmanObject;

  const GameScreen({Key? key, required this.hangmanObject}) : super(key: key);

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  // final database = score_database.openDB();
  int lives = 5;
  Alphas englishAlphabet = Alphas();
  late String word;
  late String hiddenWord;
  List<String> wordList = [];
  List<int> hintLetters = [];
  late List<bool> buttonStatus;
  late bool hintStatus;
  int hangState = 0;
  int wordCount = 0;
  bool finishedGame = false;
  bool resetGame = false;


  void success() {
    final assetsAudioPlayer = AssetsAudioPlayer();
    assetsAudioPlayer.open(
      Audio("assets/audios/right.mp3"),
      showNotification: true,
    );
  }

  void fail() {
    final assetsAudioPlayer = AssetsAudioPlayer();
    assetsAudioPlayer.open(
      Audio("assets/audios/wrong.mp3"),
      showNotification: true,
    );
  }
  void newGame() {
    setState(() {
      widget.hangmanObject.resetWords();
      lives = 5;
      wordCount = 0;
      finishedGame = false;
      resetGame = false;
      initWords();
    });
  }

  Widget createButton(index) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 3.5, vertical: 6.0),
      child: Center(
        child: ElevatedButton(
          onPressed: buttonStatus[index] ? () => wordPress(index) : null,
          child: Text(
            englishAlphabet.alphabet[index].toString().toUpperCase(),
            style: const TextStyle(fontSize: 30, color: Colors.white),
          ),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(10),
            primary: Colors.indigo,
            elevation: 0,
            fixedSize: const Size(150, 60),
          ),
        ),
      ),
    );
  }

  void returnHomePage() {
    Get.to(() => HomeScreen());
  }

  void initWords() {
    finishedGame = false;
    resetGame = false;
    hintStatus = true;
    hangState = 0;
    buttonStatus = List.generate(26, (index) {
      return true;
    });
    wordList = [];
    hintLetters = [];
    word = widget.hangmanObject.getWord();
    if (word.isNotEmpty) {
      hiddenWord = widget.hangmanObject.getHiddenWord(word.length);
    } else {
      returnHomePage();
    }

    for (int i = 0; i < word.length; i++) {
      wordList.add(word[i]);
      hintLetters.add(i);
    }
  }

  void wordPress(int index) {
    if (lives == 0) {
      returnHomePage();
    }

    if (finishedGame) {
      setState(() {
        resetGame = true;
      });
      return;
    }

    bool check = false;
    setState(() {
      for (int i = 0; i < wordList.length; i++) {
        if (wordList[i].toLowerCase() == englishAlphabet.alphabet[index]) {
          check = true;
          wordList[i] = '';
          hintLetters.remove(i);
          hiddenWord = hiddenWord.replaceFirst('_', word[i], i);
          print("---------------------$hintLetters");
        }
      }

      if (!check) {
        hangState += 1;
      }

      if (hangState == 6) {
        finishedGame = true;
        lives -= 1;
        if (lives < 1) {
          if (wordCount > 0) {
            // Score score = Score(
            //     id: 1,
            //     scoreDate: DateTime.now().toString(),
            //     userScore: wordCount);
            // score_database.manipulateDatabase(score, database);
          }
          Alert(
              style: kGameOverAlertStyle,
              context: context,
              title: "Game Over!",
              desc: "Your score is $wordCount",
              buttons: [
                DialogButton(
//                  width: 20,
                  onPressed: () => returnHomePage(),
                  child: const Icon(

                    MdiIcons.home,
                    size: 30.0,
                  ),
//                  width: 90,
                  color: Colors.white,
//                  height: 50,
                ),
                DialogButton(
//                  width: 20,
                  onPressed: () {
                    newGame();
                    Navigator.pop(context);
                  },
                  child: const Icon(MdiIcons.refresh, size: 30.0),
//                  width: 90,
                  color: Colors.white,
//                  height: 20,
                ),
              ]).show();
        } else {
          fail();
          Alert(
            context: context,
            style: kFailedAlertStyle,
            type: AlertType.error,
            title: word,
//            desc: "You Lost!",
            buttons: [
              DialogButton(

                radius: BorderRadius.circular(10),
                child: const Icon(
                  MdiIcons.arrowRightThick,
                  size: 30.0,
                ),
                onPressed: () {
                  setState(() {
                    Navigator.pop(context);
                    initWords();
                  });
                },
                width: 127,
                color:Colors.white,
                height: 52,
              ),
            ],
          ).show();
        }
        return;
      }

      buttonStatus[index] = false;
      if (hiddenWord == word) {
        finishedGame = true;
        success();
        Alert(
          context: context,
          style: kSuccessAlertStyle,
          type: AlertType.success,
          title: word,
//          desc: "You guessed it right!",
          buttons: [
            DialogButton(
              radius: BorderRadius.circular(10),
              child: const Icon(
                MdiIcons.arrowRightThick,
                size: 30.0,
              ),
              onPressed: () {
                setState(() {
                  wordCount += 1;
                  Navigator.pop(context);
                  initWords();
                });
              },
              width: 127,
              color: Colors.white,
              height: 52,
            )
          ],
        ).show();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    initWords();
  }

  @override
  Widget build(BuildContext context) {
    if (resetGame) {
      setState(() {
        initWords();
      });
    }
    return WillPopScope(
      onWillPop: () {
        return Future(() => false);
      },
      child: Scaffold(
        backgroundColor: const  Color(0xFF421b9b),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 4,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(6.0, 8.0, 6.0, 35.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Stack(
                                children: <Widget>[
                                  Container(
                                    padding: const EdgeInsets.only(top: 0.5),
                                    child: IconButton(
                                      color: Colors.white,
                                      tooltip: 'Lives',
                                      highlightColor: Colors.transparent,
                                      splashColor: Colors.transparent,
                                      iconSize: 40,
                                      icon:  const Icon(MdiIcons.heart),
                                      onPressed: () {},
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.fromLTRB(
                                        8.7, 7.9, 0, 0.8),
                                    alignment: Alignment.center,
                                    child: SizedBox(
                                      height: 38,
                                      width: 38,
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Text(
                                            lives.toString() == "1"
                                                ? "I"
                                                : lives.toString(),
                                            style: const TextStyle(
                                              color: Color(0xFF2C1E68),
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'PatrickHand',
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          Text(
                            wordCount == 1 ? "I" : '$wordCount',
                            style: kWordCounterTextStyle,
                          ),
                          IconButton(
                            color: Colors.white,
                            tooltip: 'Hint',
                            iconSize: 39,
                            icon: const Icon(MdiIcons.lightbulb),
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onPressed: hintStatus
                                ? () {
                                    int rand =
                                        Random().nextInt(hintLetters.length);
                                    wordPress(englishAlphabet.alphabet.indexOf(wordList[hintLetters[rand]].toLowerCase()));
                                    hintStatus = false;
                                  }
                                : null,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        child: FittedBox(
                          child: Image.asset(
                            'images/${hangState}-.png',
                            height: 1001,
                            width: 991,
                            gaplessPlayback: true,
                          ),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5,),
                    Expanded(
                      flex: 3,
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        child: FittedBox(
                          child: Image.asset(
                            'images/${word.toLowerCase()}.png',
                            height: 1001,
                            width: 991,
                            gaplessPlayback: true,
                          ),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 35.0),
                        alignment: Alignment.center,
                        child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            hiddenWord,
                            style: kWordTextStyle,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10.0, 2.0, 8.0, 10.0),
                child: Table(
                  defaultVerticalAlignment: TableCellVerticalAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  //columnWidths: {1: FlexColumnWidth(10)},
                  children: [
                    TableRow(children: [
                      TableCell(
                        child: createButton(0),
                      ),
                      TableCell(
                        child: createButton(1),
                      ),
                      TableCell(
                        child: createButton(2),
                      ),
                      TableCell(
                        child: createButton(3),
                      ),
                      TableCell(
                        child: createButton(4),
                      ),
                      TableCell(
                        child: createButton(5),
                      ),
                      TableCell(
                        child: createButton(6),
                      ),
                    ]),
                    TableRow(children: [
                      TableCell(
                        child: createButton(7),
                      ),
                      TableCell(
                        child: createButton(8),
                      ),
                      TableCell(
                        child: createButton(9),
                      ),
                      TableCell(
                        child: createButton(10),
                      ),
                      TableCell(
                        child: createButton(11),
                      ),
                      TableCell(
                        child: createButton(12),
                      ),
                      TableCell(
                        child: createButton(13),
                      ),
                    ]),
                    TableRow(children: [
                      TableCell(
                        child: createButton(14),
                      ),
                      TableCell(
                        child: createButton(15),
                      ),
                      TableCell(
                        child: createButton(16),
                      ),
                      TableCell(
                        child: createButton(17),
                      ),
                      TableCell(
                        child: createButton(18),
                      ),
                      TableCell(
                        child: createButton(19),
                      ),
                      TableCell(
                        child: createButton(20),
                      ),
                    ]),
                    TableRow(children: [
                      TableCell(
                        child: createButton(21),
                      ),
                      TableCell(
                        child: createButton(22),
                      ),
                      TableCell(
                        child: createButton(23),
                      ),
                      TableCell(
                        child: createButton(24),
                      ),
                      TableCell(
                        child: createButton(25),
                      ),
                      const TableCell(
                        child: Text(''),
                      ),
                      const TableCell(
                        child: Text(''),
                      ),
                    ]),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
