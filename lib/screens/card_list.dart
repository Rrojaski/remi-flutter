import 'package:flutter/material.dart';
import '../models/Chinese_Card.model.dart';

class CardListScreen extends StatefulWidget {
  @override
  createState() => new CardListState();
}

class CardListState extends State<CardListScreen> {
  List<ChineseCard> cardList = [
    new ChineseCard(character: "水", meaning: "water", piyin: "shui"),
    new ChineseCard(character: "頻果", meaning: "apple", piyin: "píngguǒ")
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
                    title: Text(cardList[index].character),
                    subtitle: Text(cardList[index].meaning)));
          },
        ));
  }
}
