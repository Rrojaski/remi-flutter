import 'package:flutter/material.dart';
import '../models/Chinese_Card.model.dart';

class CardListScreen extends StatelessWidget {
  // final List<ChineseCard> cardList = new List([
  //   new ChineseCard(
  //       character: 'Test Char', meaning: 'Test Meaning', piyin: 'Test Piyin')
  // ]);

  final List<ChineseCard> cardList = [];

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
        body: Column(
          children: <Widget>[
            Column(
              children: cardList.length > 0 ? cardList : [],
            ),
          ],
        ));
  }
}
