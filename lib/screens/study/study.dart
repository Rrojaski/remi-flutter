import 'package:flutter/material.dart';
import 'components/card_1.dart';
import 'components/card_2.dart';
import 'components/card_definition.dart';
import 'dart:math';
import '../../models/Chinese_Card.model.dart';

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
  List<ChineseCard> cardList = [
    new ChineseCard(character: "水", meaning: "water", piyin: "shui"),
    new ChineseCard(character: "頻果", meaning: "apple", piyin: "píngguǒ"),
    new ChineseCard(character: "西瓜", meaning: "watermelon", piyin: "xīguā"),
    new ChineseCard(character: "北京", meaning: "beijing", piyin: "pīn​yīn​"),
    new ChineseCard(character: "再見", meaning: "goodbye", piyin: "zàijiàn"),
    new ChineseCard(character: "後面", meaning: "behind", piyin: "hòumiàn"),
    new ChineseCard(character: "家", meaning: "yesterday", piyin: "family"),
    new ChineseCard(character: "熱", meaning: "hot", piyin: "rè"),
    new ChineseCard(character: "冷", meaning: "cold", piyin: "lěng")
  ];

  @override
  Widget build(BuildContext context) {
    List<Widget> children = new List.generate(
        1,
        (int i) => getRandomNumber() == 1
            ? new Card1(chineseCard: cardList[0])
            : new Card2(chineseCard: cardList[0]));
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
            iconTheme: IconThemeData(
              color: Colors.white, //change your color here
            ),
            title: Text(
              "Study",
              style: TextStyle(fontSize: 20, color: Colors.white),
            )),
        body: Container(
            margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: children,
            )));
  }
}
