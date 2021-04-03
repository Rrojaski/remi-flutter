import 'package:REMI/screens/study/components/card_definition.dart';
import 'package:flutter/material.dart';
import '../../../models/Chinese_Card.model.dart';
import './canvas.dart';

class Card2 extends StatefulWidget {
  Card2({Key key, this.chineseCard}) : super(key: key);

  final ChineseCard chineseCard;

  @override
  createState() => new Card2State();
}

class Card2State extends State<Card2> {
  handleClick(ChineseCard chineseCard) {
    Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => CardDefinition(chineseCard: chineseCard),
          transitionDuration: Duration(seconds: 0),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 570.0,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(vertical: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // Image.asset('assets/images/' + widget.chineseCard.image,
                    //     width: 180, height: 180),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Piyin:",
                          style: TextStyle(fontSize: 15.0, color: Colors.grey),
                        ),
                        Text(
                          widget.chineseCard.piyin,
                          style: TextStyle(
                              fontSize: 40.0, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Meaning:",
                          style: TextStyle(fontSize: 15.0, color: Colors.grey),
                        ),
                        Text(
                          widget.chineseCard.meaning,
                          style: TextStyle(
                              fontSize: 40.0, fontWeight: FontWeight.bold),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Container(
                height: 290,
                width: 290,
                // decoration: const BoxDecoration(
                //   border: Border(
                //     top: BorderSide(width: 1.0, color: Color(0xFFFF000000)),
                //     left: BorderSide(width: 1.0, color: Color(0xFFFF000000)),
                //     right: BorderSide(width: 1.0, color: Color(0xFFFF000000)),
                //     bottom: BorderSide(width: 1.0, color: Color(0xFFFF000000)),
                //   ),
                // ),
                child: new Draw(),
              ),
              RaisedButton(
                color: Colors.white,
                onPressed: () {
                  handleClick(widget.chineseCard);
                },
                child: Text("Submit"),
              ),
            ]));
  }
}
