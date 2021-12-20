import 'package:childs/data/alphabets.dart';
import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

class EveryAlphabet extends StatefulWidget {
  final String? char;

  const EveryAlphabet({Key? key, required this.char}) : super(key: key);

  @override
  _EveryAlphabetState createState() => _EveryAlphabetState();
}

class _EveryAlphabetState extends State<EveryAlphabet> {
  Alphabets alphabets = Alphabets();
  late List words;
  late String? word = widget.char;

  void playing() {
    final assetsAudioPlayer = AssetsAudioPlayer();

    assetsAudioPlayer.open(
      Audio("assets/audios/${widget.char}.mp3"),
      showNotification: true,
    );
  }
  void playingWords(String? alphaWord) {
    final assetsAudioPlayer = AssetsAudioPlayer();

    assetsAudioPlayer.open(
      Audio("assets/audios/${alphaWord.toString().toLowerCase()}.mp3"),
      showNotification: true,
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    playing();
    words = alphabets.getWords(widget.char);
    print(words);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              // margin: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/main.png"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
            margin: const EdgeInsets.only(left: 75,top: 70),
              height: 50,
              width: MediaQuery.of(context).size.width * 0.60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xFFB3E5FC),
              ),
              child: Text(
                word!,
                style: TextStyle(fontSize: 45, color: Colors.red[900]),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(50.0),
              margin: const EdgeInsets.only(top: 100),
              child: GridView.count(

                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                children: List.generate(
                  words.length, //5
                      (index) {
                    return GestureDetector(
                      onTap: (){
                        setState(() {
                          word=words[index];
                          playingWords(word);
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                        border: Border.all(width: 2,color: const Color(0xFFB3E5FC),),
                          borderRadius: BorderRadius.circular(20),),
                        child: Container(


                          // margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: AssetImage(
                                  "images/${words[index].toString().toLowerCase()}.png"),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
