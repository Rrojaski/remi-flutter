import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';

class API {
  static Future<List<QueryDocumentSnapshot>> getCards() async {
    Query query = FirebaseFirestore.instance.collection('notes');
    List<QueryDocumentSnapshot> list = new List();
    await query.get().then((querySnapshot) async {
      querySnapshot.docs.forEach((e) => {list.add(e)});
    }).catchError((error) => {print("error: $error")});
    return list;
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
