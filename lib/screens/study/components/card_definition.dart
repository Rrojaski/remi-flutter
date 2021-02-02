import 'package:REMI/screens/study/containers/study.dart';
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
                        margin: EdgeInsets.only(top: 40.0, bottom: 30.0, left: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "Piyin:",
                              style: TextStyle(
                                fontSize: 20.0,
                              ),
                              textAlign: TextAlign.right,
                            ),
                            Text(
                              widget.chineseCard.piyin,
                              style: TextStyle(
                                fontSize: 20.0,
                              ),
                            ),
                          ],
                        )),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("Meaning:",
                              style: TextStyle(
                                fontSize: 20.0,
                              ),
                              textAlign: TextAlign.right),
                          Text(
                            widget.chineseCard.meaning,
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ])
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RaisedButton(
                      textColor: Colors.white,
                      color: Colors.red,
                      onPressed: () {
                        handleClick();
                      },
                      child: Text("Bad"),
                    ),
                    RaisedButton(
                      textColor: Colors.white,
                      color: Colors.blue,
                      onPressed: () {
                        handleClick();
                      },
                      child: Text("Maybe"),
                    ),
                    RaisedButton(
                      textColor: Colors.white,
                      color: Colors.green,
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
