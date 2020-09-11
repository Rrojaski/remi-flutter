import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 255, 0, 1),
            title: Text(
              "REMI",
              style: TextStyle(fontSize: 20),
            )),
        body: Column(
          children: <Widget>[Text("Home Screen")],
        ));
  }
}
