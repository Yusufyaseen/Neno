import 'package:childs/data/alphabets.dart';
import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

class NumbersScreen extends StatelessWidget {
  Alphabets alphas = Alphabets();

  NumbersScreen({Key? key}) : super(key: key);

  void playing(String num) {
    final assetsAudioPlayer = AssetsAudioPlayer();
    List number = num.split(" ");
    assetsAudioPlayer.open(
      Audio("assets/audios/${number[0]}.mp3"),
      showNotification: true,
    );
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
                padding: const EdgeInsets.all(50.0),
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20.0,
                  mainAxisSpacing: 15.0,
                  children: List.generate(
                    alphas.getNumber().length,
                        (index) {
                      return GestureDetector(
                        onTap: () => playing(alphas.getNumber()[index]),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(width: 1,color: const Color(0xFFB3E5FC),),
                            borderRadius: BorderRadius.circular(40),
                            image: DecorationImage(
                              
                              image: AssetImage(
                                  "images/${alphas.getNumber()[index]}.png"),
                              fit: BoxFit.fill,
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





