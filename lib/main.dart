import 'package:REMI/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: primaryColor),
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
