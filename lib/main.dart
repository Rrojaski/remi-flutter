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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.yellow),
      home: Scaffold(
        body: Column(
          children: <Widget>[
            SplashScreen(),
          ],
        ),
      ),
    );
  }
}
