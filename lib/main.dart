import 'package:flutter/material.dart';
import './screens/splash.dart';

void main() => runApp(App());

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AppState();
  }
}

class _AppState extends State<App> {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 255, 0, 1),
          title: Text(
            "REMI",
            style: TextStyle(fontSize: 20),
          ),
        ),
        body: Column(
          children: <Widget>[
            SplashScreen(),
            Container(
              child: Text("Hello"),
            )
          ],
        ),
      ),
    );
  }
}
