import 'package:REMI/screens/study/card_definition.dart';
import 'package:flutter/material.dart';
import '../../models/Chinese_Card.model.dart';

class Card2 extends StatefulWidget {
  Card2({Key key, this.chineseCard}) : super(key: key);

  final ChineseCard chineseCard;

  @override
  createState() => new Card2State();
}

class Card2State extends State<Card2> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 450.0,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                widget.chineseCard.character,
                style: TextStyle(fontSize: 120.0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RaisedButton(
                    color: Colors.white,
                    onPressed: () {},
                    child: Text("Bad"),
                  ),
                  RaisedButton(
                    color: Colors.white,
                    onPressed: () {},
                    child: Text("Maybe"),
                  ),
                  RaisedButton(
                    color: Colors.white,
                    onPressed: () {},
                    child: Text("Good"),
                  )
                ],
              )
            ]));
  }
}
