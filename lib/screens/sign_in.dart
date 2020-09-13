import 'dart:convert';

import 'package:flutter/material.dart';
import './dashboard.dart';
// import 'package:http/http.dart' as http;

class SignInScreen extends StatelessWidget {
  Future<void> signIn(context) async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DashboardScreen()),
    );
    // var json = jsonEncode({'id': 1, 'name': 'adam'});
    // const url = 'https://jsonplaceholder.typicode.com/posts';
    // var reponse = await http.post(url,
    //     body: json,
    //     headers: {"Content-type": "application/json; charset=UTF-8"});
    // print(reponse.body);
  }

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
                      obscureText: true,
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
                      onPressed: () {
                        signIn(context);
                      },
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
