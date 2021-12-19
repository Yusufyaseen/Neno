import 'package:childs/data/alphabets.dart';
import 'package:childs/screens/every_alphabet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlphabetsScreen extends StatelessWidget {
  Alphabets alphas = Alphabets();

  AlphabetsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                crossAxisCount: 3,
                crossAxisSpacing: 20.0,
                mainAxisSpacing: 15.0,
                children: List.generate(
                  alphas.getAsList().length,
                  (index) {
                    return GestureDetector(
                      onTap: () => Get.to(() => EveryAlphabet(
                        char: alphas.getAsList()[index].key,
                      )),
                      child: Container(
                        // margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                                "images/${alphas.getAsList()[index].key}.png"),
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
