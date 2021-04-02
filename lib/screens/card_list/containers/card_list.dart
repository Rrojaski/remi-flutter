import 'package:flutter/material.dart';
import '../../../models/Chinese_Card.model.dart';
import '../../../api/api.dart';
import '../../../components/primary_app_bar/primary_app_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CardListScreen extends StatefulWidget {
  @override
  createState() => new CardListState();
}

class CardListState extends State<CardListScreen> {
  List<ChineseCard> cardList = [];

  /// Get Cards from api and set the state
  getCards() async {
    List<QueryDocumentSnapshot> cardListToMap = await API.getCards();

    setState(() {
      cardList = cardListToMap.map((document) {
        Map data = document.data();

        return new ChineseCard(
            id: document.id,
            character: data['character'],
            meaning: data['meaning'],
            piyin: data['piyin'],
            rating: data['rating'],
            image: "water.png");
      }).toList();
    });
  }

  /// Delete Card with id
  deleteCard(String id, int index) async {
    bool deleteSuccess = await API.deleteCard(id);

    if (deleteSuccess) {
      setState(() => {cardList.removeAt(index)});
    }
  }

  @override
  void initState() {
    getCards();
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
                            subtitle: Text(cardList[index].meaning),
                            trailing: IconButton(
                                icon: Icon(
                                  Icons.close,
                                  color: Colors.grey,
                                  size: 20.0,
                                ),
                                onPressed: () {
                                  deleteCard(cardList[index].id, index);
                                }),
                          ));
                        },
                      ),
                    ))),
          ]),
    );
  }
}
