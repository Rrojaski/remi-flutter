import 'package:flutter/material.dart';
import '../card_list/card_list.dart';
import '../study/study.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            iconTheme: IconThemeData(
              color: Colors.white, //change your color here
            ),
            title: Text(
              "Dashboard",
              style: TextStyle(fontSize: 20, color: Colors.white),
            )),
        body: Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 80.0, bottom: 50.0),
                  child: Text(
                    "Card Proggress Bar",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                  width: 300.0,
                  child: LinearProgressIndicator(
                    value: 80 / 100,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 80.0, bottom: 10.0),
                  child: ButtonTheme(
                    minWidth: 300.0,
                    child: RaisedButton(
                      color: Colors.white,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CardListScreen()));
                      },
                      child: Text("Card List"),
                    ),
                  ),
                ),
                ButtonTheme(
                  minWidth: 300.0,
                  child: RaisedButton(
                    color: Colors.white,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StudyScreen()));
                    },
                    child: Text("Study"),
                  ),
                )
              ],
            )));
  }
}
