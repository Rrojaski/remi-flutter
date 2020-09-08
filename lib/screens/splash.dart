import 'package:flutter/material.dart';
import '../assets/';
class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(20),
        width: double.infinity,
        child: Column(children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(width: 100, child: Text("Account 1234")),
              Flexible(child: TextFormField(keyboardType: TextInputType.text))
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(width: 100, child: Text("Amount Found Not Here")),
              Flexible(child: TextFormField(keyboardType: TextInputType.number))
            ],
          ),
          Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              child: Text("Percentage Calculator Calculator")),
          RaisedButton(
            child: Text("Add"),
          ),
        ]));
  }
}
