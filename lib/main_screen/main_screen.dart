import 'package:childs/screens/alphabet_screen.dart';
import 'package:childs/screens/home_screen.dart';
import 'package:childs/screens/numbers_screen.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

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
            Center(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () => Get.to(() =>  NumbersScreen()),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.75,
                          height: 150,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("images/numbers.png"),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () => Get.to(() =>  AlphabetsScreen()),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 140,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("images/alphapet.png"),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () => Get.to(() =>  HomeScreen()),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.75,
                          height: 140,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("images/gamez.png"),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
