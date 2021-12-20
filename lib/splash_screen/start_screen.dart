import '../main_screen/main_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/1st.png"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 400),
              child: ElevatedButton(
                onPressed: () => Get.off(() => const MainScreen()),
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
            ),
          ],
        ),
      ),
    );
  }
}
