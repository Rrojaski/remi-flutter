import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding:
                const EdgeInsets.only(top: 50, right: 15, bottom: 0, left: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                    margin: const EdgeInsets.only(bottom: 30),
                    child: Image.asset(
                      'assets/images/kawai_girl.png',
                      height: 200,
                    )),
                Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Email',
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    )),
                Container(
                    margin: const EdgeInsets.only(bottom: 30),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Password',
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RaisedButton(
                      onPressed: () {},
                      child: Text("Sign In"),
                    ),
                    RaisedButton(
                      onPressed: () {},
                      child: Text("Sign Up"),
                    )
                  ],
                )
              ],
            )));
  }
}
