import 'package:flutter/material.dart';
import 'dart:math';
import '../components/card_1.dart';
import '../components/card_2.dart';
import '../../../models/Chinese_Card.model.dart';
import '../../../api/api.dart';
import '../../../components/primary_app_bar/primary_app_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

/// Get Random number
int getRandomNumber(int maxNumber, [int lastCardNumber]) {
  int randomNumber;

  do {
    Random random = new Random();
    randomNumber = random.nextInt(maxNumber);
  } while (lastCardNumber == randomNumber);

  return randomNumber;
}

class StudyScreen extends StatefulWidget {
  /// forcedRefresh used to rerender without making another api call
  final bool forcedRefresh;

  /// never show a card twice in a row
  final String lastCardId;

  StudyScreen([this.forcedRefresh = false, this.lastCardId]);

  @override
  createState() => new StudyScreenState();
}

class StudyScreenState extends State<StudyScreen> {
  int randomCardTypeIndex = getRandomNumber(2);

  List<ChineseCard> cardList = [];

  ChineseCard currentCardDisplayed;

  @override
  void initState() {
    _getCards();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: getPrimaryAppBar("Study"),
        body: Container(
            margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: _getCardDisplay(),
            )));
  }

  /// Get list of cards
  void _getCards() async {
    List<QueryDocumentSnapshot> cardListToMap =
        await API.getCards(!widget.forcedRefresh);

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

    _setRandomCard();
  }

  /// Set random card
  void _setRandomCard() {
    currentCardDisplayed = _getRandomCard();
  }

  /// Return random card that is not the last card returned
  ChineseCard _getRandomCard() {
    ChineseCard randomCard;
    do {
      randomCard = cardList[getRandomNumber(cardList.length)];
    } while (randomCard.id == widget.lastCardId);

    return randomCard;
  }

  /// Display spinner or random card type
  List<Widget> _getCardDisplay() {
    return (cardList.length > 0 && currentCardDisplayed != null)
        ? new List.generate(
            1,
            (int i) => randomCardTypeIndex == 1
                ? new Card1(chineseCard: currentCardDisplayed)
                : new Card2(chineseCard: currentCardDisplayed))
        : new List.generate(1, (int i) => new CircularProgressIndicator());
  }
}
