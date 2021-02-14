import 'package:flutter/material.dart';
import '../auth/sign_in.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/images/kawai_girl.png'),
              Container(
                child: Text(
                  "Welcome to REMI",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              RaisedButton(
                color: Colors.white,
                onPressed: () {
                  Navigator.pushReplacementNamed(context, "/signIn");
                },
                child: Text("Get Started"),
              )
            ]));
  }
}
