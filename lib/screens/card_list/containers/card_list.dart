import 'package:REMI/screens/add_card/add_card.dart';
import 'package:flutter/material.dart';
import '../../../models/Chinese_Card.model.dart';
import '../../../api/api.dart';
import '../../../components/primary_app_bar/primary_app_bar.dart';

class CardListScreen extends StatefulWidget {
  @override
  createState() => new CardListState();
}

class CardListState extends State<CardListScreen> {
  List<ChineseCard> cardList = [];

  @override
  void initState() {
    API.getCards().then((value) => {
          setState(() {
            var mappedList = value.map((element) {
              return new ChineseCard(
                  id: element['id'],
                  character: element['character'],
                  meaning: element['meaning'],
                  piyin: element['piyin'],
                  rating: element['rating'],
                  image: "water.png");
            });
            cardList = mappedList.toList();
          })
        });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getPrimaryAppBar("Card List"),
      body: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddCardScreen()),
                      );
                    },
                    child: Text("Add"),
                  )
                ],
              ),
            ),
            Expanded(
                child: SizedBox(
                    height: 200.0,
                    child: Container(
                      child: new ListView.builder(
                        itemCount: cardList.length,
                        itemBuilder: (context, index) {
                          return Card(
                              child: ListTile(
                                  leading: Text(
                                    cardList[index].character,
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  title: Text(cardList[index].piyin),
                                  subtitle: Text(cardList[index].meaning)));
                        },
                      ),
                    ))),
          ]),
    );
  }
}
