import 'package:REMI/screens/add_card/add_card.dart';
import 'package:REMI/screens/card_list/containers/card_list.dart';
import 'package:REMI/screens/dashboard/dashboard.dart';
import 'package:flutter/material.dart';

class PrimaryBottomNav extends StatefulWidget {
  @override
  createState() => new PrimaryBottomNavState();
}

class PrimaryBottomNavState extends State<PrimaryBottomNav> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        color: Colors.transparent,
        elevation: 0,
        child: Container(
            margin: EdgeInsets.only(bottom: 20.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                      icon: Icon(
                        Icons.home,
                        color: Colors.grey,
                        size: 40.0,
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (_, __, ___) => DashboardScreen(),
                            transitionDuration: Duration(seconds: 0),
                          ),
                        );
                      }),
                  ClipOval(
                    child: Material(
                      color: Colors.blue, // button color
                      child: InkWell(
                        splashColor: Colors.red, // inkwell color
                        child: SizedBox(
                            width: 56,
                            height: 56,
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                            )),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddCardScreen()));
                        },
                      ),
                    ),
                  ),
                  IconButton(
                      icon: Icon(
                        Icons.list,
                        color: Colors.grey,
                        size: 40.0,
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (_, __, ___) => CardListScreen(),
                            transitionDuration: Duration(seconds: 0),
                          ),
                        );
                      }),
                ])));
  }
}
