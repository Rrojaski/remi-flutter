import 'package:flutter/material.dart';
import '../models/Chinese_Card.model.dart';

class CardListScreen extends StatefulWidget {
  @override
  createState() => new CardListState();
}

class CardListState extends State<CardListScreen> {
  List<ChineseCard> cardList = [
    new ChineseCard(character: "水", meaning: "water", piyin: "shui"),
    new ChineseCard(character: "頻果", meaning: "apple", piyin: "píngguǒ"),
    new ChineseCard(character: "西瓜", meaning: "watermelon", piyin: "xīguā"),
    new ChineseCard(character: "北京", meaning: "beijing", piyin: "pīn​yīn​")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 255, 0, 1),
            title: Text(
              "Card List",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            )),
        body: new ListView.builder(
          itemCount: cardList.length,
          itemBuilder: (context, index) {
            return Card(
                child: ListTile(
                    leading: Text(
                      cardList[index].character,
                      style: TextStyle(fontSize: 20),
                    ),
                    title: Text(cardList[index].piyin),
                    subtitle: Text(cardList[index].meaning)));
          },
        ));
  }
}
