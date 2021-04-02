import 'package:flutter/material.dart';
import 'dart:math';
import '../components/card_1.dart';
import '../components/card_2.dart';
import '../../../models/Chinese_Card.model.dart';
import '../../../api/api.dart';
import '../../../components/primary_app_bar/primary_app_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StudyScreen extends StatefulWidget {
  int randomCardTypeNumber = getRandomNumber(2);
  int randomCardNumber = getRandomNumber(5);

  List<ChineseCard> cardList = [];
  // [
  //   new ChineseCard(
  //       character: "水", meaning: "water", piyin: "shui", image: 'water.png'),
  //   new ChineseCard(
  //       character: "頻果",
  //       meaning: "apple",
  //       piyin: "píngguǒ",
  //       image: 'apple.png'),
  //   new ChineseCard(
  //       character: "西瓜",
  //       meaning: "watermelon",
  //       piyin: "xīguā",
  //       image: 'watermelon.png'),
  //   new ChineseCard(
  //       character: "北京",
  //       meaning: "beijing",
  //       piyin: "běijīng",
  //       image: 'beijing.jpg'),
  //   new ChineseCard(
  //       character: "再見",
  //       meaning: "goodbye",
  //       piyin: "zàijiàn",
  //       image: 'goodbye.jpg'),
  //   new ChineseCard(
  //       character: "謝謝",
  //       meaning: "goodbye",
  //       piyin: "xièxie",
  //       image: 'water.jpg'),
  //   new ChineseCard(
  //       character: "後面",
  //       meaning: "behind",
  //       piyin: "hòumiàn",
  //       image: 'behind.jpg'),
  //   new ChineseCard(
  //       character: "喜歡",
  //       meaning: "to like",
  //       piyin: "xǐhuān",
  //       image: 'water.jpg'),
  //   new ChineseCard(
  //       character: "家", meaning: "family", piyin: "jiā", image: 'family.jpg'),
  //   new ChineseCard(
  //       character: "熱", meaning: "hot", piyin: "rè", image: 'hot.jpg'),
  //   new ChineseCard(
  //       character: "冷", meaning: "cold", piyin: "lěng", image: 'cold.PNG')
  // ];

  @override
  createState() => new StudyScreenState();
}

getRandomNumber(int maxNumber) {
  Random random = new Random();
  int randomNumber = random.nextInt(maxNumber);
  return randomNumber;
}

class StudyScreenState extends State<StudyScreen> {
  _getCards() async {
    List<QueryDocumentSnapshot> cardListToMap = await API.getCards();

    setState(() {
      widget.cardList = cardListToMap.map((document) {
        Map data = document.data();
        return new ChineseCard(
            id: document.id,
            character: data['character'],
            meaning: data['meaning'],
            piyin: data['piyin'],
            rating: data['rating'],
            image: "water.png");
      }).toList();
      widget.randomCardNumber = getRandomNumber(widget.cardList.length);
    });
  }

  @override
  void initState() {
    _getCards();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children;

    children = widget.cardList.length > 0
        ? new List.generate(
            1,
            (int i) => widget.randomCardTypeNumber == 1
                ? new Card1(
                    chineseCard: widget.cardList[widget.randomCardNumber])
                : new Card2(
                    chineseCard: widget.cardList[widget.randomCardNumber]))
        : new List.generate(1, (int i) => new CircularProgressIndicator());

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: getPrimaryAppBar("Study"),
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
