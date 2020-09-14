import 'package:flutter/material.dart';
import './card_list.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 255, 0, 1),
            title: Text(
              "Dashboard",
              style: TextStyle(fontSize: 20, color: Colors.white),
            )),
        body: Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text("Home Screen"),
                RaisedButton(
                  color: Colors.white,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CardListScreen()));
                  },
                  child: Text("Card List"),
                )
              ],
            )));
  }
}
