import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import 'dart:math';
import 'dart:convert';
import 'components/card_1.dart';
import 'components/card_2.dart';
import '../../models/Chinese_Card.model.dart';

class StudyScreen extends StatefulWidget {
  final int randomCardTypeNumber = getRandomNumber(2);
  final int randomCardNumber = getRandomNumber(5);

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
        character: "後面",
        meaning: "behind",
        piyin: "hòumiàn",
        image: 'behind.jpg'),
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
  String url = "https://remi20200913113417.azurewebsites.net/api/cards";
  Future<List<ChineseCard>> getCards() async {
    var response = await http.get(Uri.encodeFull(url));
    List list = jsonDecode(response.body);
    print("list: ");
    print(list);
    var mappedList = list.map((element) {
      return new ChineseCard(
          id: element['id'],
          character: element['character'],
          meaning: element['meaning'],
          piyin: element['piyin'],
          image: "water.png");
    });

    return mappedList.toList();
  }

  @override
  void initState() {
    getCards().then((value) => widget.cardList = value);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children = new List.generate(
        1,
        (int i) => widget.randomCardTypeNumber == 1
            ? new Card1(chineseCard: widget.cardList[widget.randomCardNumber])
            : new Card2(chineseCard: widget.cardList[widget.randomCardNumber]));
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
