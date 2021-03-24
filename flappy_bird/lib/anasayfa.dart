import 'dart:async';

import 'package:flappy_bird/barriers.dart';
import 'package:flappy_bird/bird.dart';
import 'package:flutter/material.dart';

class AnaSayfa extends StatefulWidget {
  @override
  _AnaSayfaState createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  double birdYaxis = 0;
  double time = 0;
  double height = 0;
  double initialHeight = 0;
  bool gameHasStarted = false;
  static double barrierXone = 0.0;
  double barrierXtwo = barrierXone + 1.5;

  void jump() {
    time = 0;
    initialHeight = birdYaxis;
  }

  void startGame() {
    gameHasStarted = true;
    Timer.periodic(Duration(milliseconds: 60), (callback) {
      time += 0.05;
      height = -4.9 * time * time + 2.8 * time;

      setState(() {
        birdYaxis = initialHeight - height;
      });
      setState(() {
        if (barrierXone < -1.1) {
          barrierXone += 2.3;
        } else {
          barrierXone -= 0.05;
        }
      });
      setState(() {
        if (barrierXtwo < -1.1) {
          barrierXtwo += 2.2;
        } else {
          barrierXtwo -= 0.05;
        }
      });

      if (birdYaxis > 1) {
        callback.cancel();
        gameHasStarted = false;
      }
    });
  }

  @override
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (gameHasStarted) {
          jump();
        } else {
          startGame();
        }
      },
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
                flex: 2,
                child: Stack(
                  children: [
                    AnimatedContainer(
                      alignment: Alignment(0, birdYaxis),
                      duration: Duration(milliseconds: 0),
                      decoration: BoxDecoration(color: Colors.blue),
                      child: Kusum(),
                    ),
                    Container(
                      alignment: Alignment(0, -0.3),
                      child: gameHasStarted
                          ? Text(" ")
                          : Text(
                              "OYNAMAK İÇİN TIKLA",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                    ),
                    AnimatedContainer(
                        alignment: Alignment(barrierXone, 1.1),
                        duration: Duration(microseconds: 0),
                        child: Bariyerler(size: 150.0)),
                    AnimatedContainer(
                        alignment: Alignment(barrierXone, -1.1),
                        duration: Duration(microseconds: 0),
                        child: Bariyerler(size: 140.0)),
                    AnimatedContainer(
                        alignment: Alignment(barrierXtwo, 1.1),
                        duration: Duration(microseconds: 0),
                        child: Bariyerler(size: 130.0)),
                    AnimatedContainer(
                        alignment: Alignment(barrierXtwo, -1.1),
                        duration: Duration(microseconds: 0),
                        child: Bariyerler(size: 190.0))
                  ],
                )),
            Container(
              height: 15,
              color: Colors.green,
            ),
            Expanded(
                child: Container(
              color: Colors.brown,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Score",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text("0",
                          style: TextStyle(color: Colors.white, fontSize: 20))
                    ],
                  ),
                  SizedBox(width: 20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Best",
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                      SizedBox(
                        height: 20,
                      ),
                      Text("0",
                          style: TextStyle(color: Colors.white, fontSize: 20))
                    ],
                  )
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
