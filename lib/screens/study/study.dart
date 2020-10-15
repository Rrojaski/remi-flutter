import 'package:flutter/material.dart';
import 'dart:math';
import 'components/card_1.dart';
import 'components/card_2.dart';
import '../../models/Chinese_Card.model.dart';
import '../../api/api.dart';

class StudyScreen extends StatefulWidget {
  final int randomCardTypeNumber = getRandomNumber(2);
  int randomCardNumber = getRandomNumber(5);

  List<ChineseCard> cardList = [
    new ChineseCard(
        character: "水", meaning: "water", piyin: "shui", image: 'water.png'),
    new ChineseCard(
        character: "頻果",
        meaning: "apple",
        piyin: "píngguǒ",
        image: 'apple.png'),
    new ChineseCard(
        character: "西瓜",
        meaning: "watermelon",
        piyin: "xīguā",
        image: 'watermelon.png'),
    new ChineseCard(
        character: "北京",
        meaning: "beijing",
        piyin: "běijīng",
        image: 'beijing.jpg'),
    new ChineseCard(
        character: "再見",
        meaning: "goodbye",
        piyin: "zàijiàn",
        image: 'goodbye.jpg'),
    new ChineseCard(
        character: "謝謝",
        meaning: "goodbye",
        piyin: "xièxie",
        image: 'water.jpg'),
    new ChineseCard(
        character: "後面",
        meaning: "behind",
        piyin: "hòumiàn",
        image: 'behind.jpg'),
    new ChineseCard(
        character: "喜歡",
        meaning: "to like",
        piyin: "xǐhuān",
        image: 'water.jpg'),
    new ChineseCard(
        character: "家", meaning: "family", piyin: "jiā", image: 'family.jpg'),
    new ChineseCard(
        character: "熱", meaning: "hot", piyin: "rè", image: 'hot.jpg'),
    new ChineseCard(
        character: "冷", meaning: "cold", piyin: "lěng", image: 'cold.PNG')
  ];

  @override
  createState() => new StudyScreenState();
}

getRandomNumber(int maxNumber) {
  Random random = new Random();
  int randomNumber = random.nextInt(maxNumber);
  return randomNumber;
}

class StudyScreenState extends State<StudyScreen> {
  _getCards() {
    if (widget.cardList.length > 0) return;
    API.getCards().then((value) => {
          setState(() {
            var mappedList = value.map((element) {
              return new ChineseCard(
                  id: element['id'],
                  character: element['character'],
                  meaning: element['meaning'],
                  piyin: element['piyin'],
                  image: "water.png");
            });
            widget.cardList = mappedList.toList();
            widget.randomCardNumber = getRandomNumber(widget.cardList.length);
          })
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
    if (widget.cardList.length > 0) {
      children = new List.generate(
          1,
          (int i) => widget.randomCardTypeNumber == 1
              ? new Card1(chineseCard: widget.cardList[widget.randomCardNumber])
              : new Card2(
                  chineseCard: widget.cardList[widget.randomCardNumber]));
    } else {
      children =
          new List.generate(1, (int i) => new CircularProgressIndicator());
    }
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
