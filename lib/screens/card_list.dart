import 'package:flutter/material.dart';
import '../models/Chinese_Card.model.dart';

class CardListScreen extends StatefulWidget {
  @override
  createState() => new CardListState();
}

class CardListState extends State<CardListScreen> {
  // final List<ChineseCard> cardList = [];

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
          itemBuilder: (context, index) {
            if (index < 5) {
              return new ListTile(
                  title: Text("愛"), subtitle: Text('Love'));
            }
          },
        ));
  }
}
