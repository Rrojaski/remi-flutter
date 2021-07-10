import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';

List<QueryDocumentSnapshot> cardList;

class API {

  /// Get cards from notes
  /// Return previous api response if refreshList is false
  static Future<List<QueryDocumentSnapshot>> getCards(
      [bool refreshList = true]) async {
    if (refreshList) {
      Query query = FirebaseFirestore.instance.collection('notes');
      await query.get().then((querySnapshot) async {
        cardList = new List();
        querySnapshot.docs.forEach((e) => {cardList.add(e)});
      }).catchError((error) => {print("error: $error")});
    }
    return cardList;
  }

  static Future<bool> addCard(
      String character, String piyin, String meaning) async {
    CollectionReference notes = FirebaseFirestore.instance.collection('notes');
    return notes
        .add({
          'character': character,
          'piyin': piyin,
          'meaning': meaning,
          'rating': 0
        })
        .then((value) => true)
        .catchError((error) => {print("Failed to add card: $error")});
  }

  static Future<bool> deleteCard(String id) async {
    CollectionReference notes = FirebaseFirestore.instance.collection('notes');
    print('Deleting id: $id');
    return notes
        .doc(id)
        .delete()
        .then((value) => true)
        .catchError((error) => {print("Failed to add card: $error")});
  }
}
