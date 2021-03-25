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

  getCards() {
    API.getCards().then((value) => {
          setState(() {
            var mappedList = value.map((document) {
              Map data = document.data();
              return new ChineseCard(
                  id: document.id,
                  character: data['character'],
                  meaning: data['meaning'],
                  piyin: data['piyin'],
                  rating: data['rating'],
                  image: "water.png");
            });
            cardList = mappedList.toList();
          })
        });
  }

  deleteCard(String id, int index) {
    API.deleteCard(id).then((value) => {
          print('Delete Success, remve index: $index'),
          if (value)
            {
              setState(() => {cardList.removeAt(index)})
            }
        });
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
