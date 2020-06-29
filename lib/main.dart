import 'package:flutter/material.dart';
import 'itemizedList.dart';

int addNumbers(num1, num2) {
  return num1 + num2;
}

void main() => runApp(App());

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AppState();
  }
}

class _AppState extends State<App> {
  String name = "bob sagat beaver does it all";
  List<String> list = [];

  /// Add to list
  void addToList(String value) {
    setState(() {
      this.list.add(value);
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 0, 0, 1),
          title: Text(
            "Money App Reloaded 2.3",
            style: TextStyle(fontSize: 20),
          ),
        ),
        body: Column(
          children: <Widget>[
            ItemizedList(this.list, this.addToList),
          ],
        ),
      ),
    );
  }
}
