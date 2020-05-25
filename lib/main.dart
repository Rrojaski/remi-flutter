import 'package:flutter/material.dart';

int addNumbers(num1, num2) {
  return num1 + num2;
}

void raname(String original, String replace) {
  original = replace;
}

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  String name = "bob";
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Welcome " + this.name),
        ),
        body: Column(
          children: <Widget>[
            Text('Another widget'),
            RaisedButton(
              child: Text("one"),
              onPressed: () => addNumbers(2, 3),
            ),
            RaisedButton(
              child: Text("Raname"),
              onPressed: () => raname(this.name, 'steve'),
            ),
            RaisedButton(child: Text("three")),
          ],
        ),
      ),
    );
  }
}
