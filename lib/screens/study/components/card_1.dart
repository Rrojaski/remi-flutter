import 'package:REMI/screens/study/components/card_definition.dart';
import 'package:flutter/material.dart';
import '../../../models/Chinese_Card.model.dart';
import 'package:REMI/screens/study/components/card_definition.dart';

class Card1 extends StatefulWidget {
  Card1({Key key, this.chineseCard}) : super(key: key);

  final ChineseCard chineseCard;

  @override
  createState() => new Card1State();
}

class Card1State extends State<Card1> {
  handleClick(ChineseCard chineseCard) {
    Navigator.pop(context);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CardDefinition(chineseCard: chineseCard)));
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Container(
            width: double.infinity,
            height: 450.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  widget.chineseCard.character,
                  style: TextStyle(fontSize: 120.0),
                ),
                Column(children: <Widget>[
                  Container(
                      margin: const EdgeInsets.only(bottom: 30),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Piyin',
                        ),
                      )),
                  Container(
                      margin: const EdgeInsets.only(bottom: 30),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Meaning',
                        ),
                      )),
                  RaisedButton(
                    color: Colors.white,
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        handleClick(widget.chineseCard);
                      }
                      ;
                    },
                    child: Text("Submit"),
                  ),
                ]),
              ],
            )));
  }
}
