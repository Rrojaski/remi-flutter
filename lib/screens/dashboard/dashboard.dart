import 'package:REMI/components/primary_bottom_nav/primary_bottom_nav.dart';
import 'package:flutter/material.dart';
import '../study/containers/study.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            iconTheme: IconThemeData(
              color: Colors.white, //change your color here
            ),
            title: Text(
              "Dashboard",
              style: TextStyle(fontSize: 20, color: Colors.white),
            )),
        bottomNavigationBar: PrimaryBottomNav(),
        body: Container(
          margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
          child: SizedBox(
              width: double.infinity,
              child: Card(
                  child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => StudyScreen()));
                },
                child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 40.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/kawai_girl.png',
                            width: 180,
                            height: 180,
                          ),
                          Text(
                            'STUDY',
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ])),
              ))),
        )

        // Container(
        //     width: double.infinity,
        //     child: Column(
        //       mainAxisAlignment: MainAxisAlignment.start,
        //       crossAxisAlignment: CrossAxisAlignment.center,
        //       children: <Widget>[
        //         Container(
        //           margin: EdgeInsets.only(top: 80.0, bottom: 50.0),
        //           child: Text(
        //             "Card Proggress Bar",
        //             style: TextStyle(
        //               fontSize: 20,
        //             ),
        //           ),
        //         ),
        //         SizedBox(
        //           height: 20.0,
        //           width: 300.0,
        //           child: LinearProgressIndicator(
        //             value: 80 / 100,
        //           ),
        //         ),
        //         ButtonTheme(
        //           minWidth: 300.0,
        //           child: RaisedButton(
        //             color: Colors.white,
        //             onPressed: () {
        //               Navigator.push(
        //                   context,
        //                   MaterialPageRoute(
        //                       builder: (context) => StudyScreen()));
        //             },
        //             child: Text("Study"),
        //           ),
        //         ),
        //       ],
        //     ))
        );
  }
}
