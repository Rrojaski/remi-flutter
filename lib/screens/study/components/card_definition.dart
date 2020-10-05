import 'package:REMI/screens/study/study.dart';
import 'package:flutter/material.dart';
import '../../../models/Chinese_Card.model.dart';

class CardDefinition extends StatefulWidget {
  CardDefinition({Key key, this.chineseCard}) : super(key: key);
  final ChineseCard chineseCard;
  @override
  createState() => CardDefinitionState();
}

class CardDefinitionState extends State<CardDefinition> {
  handleClick() {
    Navigator.pop(context);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => StudyScreen()));
  }

  @override
  Widget build(BuildContext context) {
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
            margin: EdgeInsets.symmetric(vertical: 50.0, horizontal: 30.0),
            width: double.infinity,
            height: 570.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: [
                    Text(
                      widget.chineseCard.character,
                      style: TextStyle(fontSize: 120.0),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 40.0, bottom: 30.0),
                      child: Text(
                        widget.chineseCard.piyin,
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    Text(
                      widget.chineseCard.meaning,
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RaisedButton(
                      color: Colors.white,
                      onPressed: () {
                        handleClick();
                      },
                      child: Text("Bad"),
                    ),
                    RaisedButton(
                      color: Colors.white,
                      onPressed: () {
                        handleClick();
                      },
                      child: Text("Maybe"),
                    ),
                    RaisedButton(
                      color: Colors.white,
                      onPressed: () {
                        handleClick();
                      },
                      child: Text("Good"),
                    )
                  ],
                )
              ],
            )));
  }
}
