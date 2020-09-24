import 'package:REMI/screens/study/card_definition.dart';
import 'package:flutter/material.dart';
import '../../models/Chinese_Card.model.dart';

class Card1 extends StatefulWidget {
  Card1({Key key, this.chineseCard}) : super(key: key);

  final ChineseCard chineseCard;

  @override
  createState() => new Card1State();
}

class Card1State extends State<Card1> {
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
            Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Container(
                      margin: const EdgeInsets.only(bottom: 30),
                      child: TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: 'Meaning',
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      )),
                  Container(
                      margin: const EdgeInsets.only(bottom: 30),
                      child: TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: 'Piyin',
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      )),
                  RaisedButton(
                    color: Colors.white,
                    onPressed: () {},
                    child: Text("Submit"),
                  ),
                ])
          ],
        ));
  }
}
