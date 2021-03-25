import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
// import 'package:http/http.dart' as http;

class SignInScreen extends StatelessWidget {
  Future<void> signIn(context) async {
    Navigator.pushReplacementNamed(context, "/dashboard");
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
        resizeToAvoidBottomInset: false,
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 52),
            // const EdgeInsets.only(top: 50, right: 15, bottom: 0, left: 15),
            child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(bottom: 30),
                      child: Icon(
                        CupertinoIcons.person_solid,
                        size: 200.0,
                      ),
                      //  Image.asset(
                      //   'assets/images/kawai_girl.png',
                      //   height: 200,
                      // )),
                    ),
                    Container(
                        margin: const EdgeInsets.only(bottom: 0),
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
                        margin: const EdgeInsets.only(bottom: 0),
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
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ButtonTheme(
                          minWidth: 300.0,
                          child: RaisedButton(
                            color: Colors.white,
                            onPressed: () {
                              signIn(context);
                            },
                            child: Text("Sign In"),
                          ),
                        ),
                        // Container(
                        //   margin: EdgeInsets.only(top: 30.0, bottom: 10.0),
                        //   child: Text("Don't have an account?"),
                        // ),
                        // ButtonTheme(
                        //     minWidth: 300.0,
                        //     child: RaisedButton(
                        //       color: Colors.white,
                        //       onPressed: () {},
                        //       child: Text("Sign Up"),
                        //     ))
                      ],
                    )
                  ],
                ))));
  }
}
