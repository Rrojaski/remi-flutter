import 'package:flutter/material.dart';
import './card_1.dart';
import './card_2.dart';
import './card_definition.dart';
import 'dart:math';

class StudyScreen extends StatefulWidget {
  @override
  createState() => new StudyScreenState();
}

getRandomNumber() {
  Random random = new Random();
  int randomNumber = random.nextInt(2);
  return randomNumber;
}

class StudyScreenState extends State<StudyScreen> {
  @override
  Widget build(BuildContext context) {
    List<Widget> children = new List.generate(
        1, (int i) => getRandomNumber() == 1 ? new Card1() : new Card2());
    return Scaffold(
        appBar: AppBar(
            iconTheme: IconThemeData(
              color: Colors.white, //change your color here
            ),
            backgroundColor: Color.fromARGB(255, 255, 0, 1),
            title: Text(
              "Study",
              style: TextStyle(fontSize: 20, color: Colors.white),
            )),
        body: Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: children,
            )));
  }
}
