import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';

class API {
  static Future<List<dynamic>> getCards() async {
    Query query = FirebaseFirestore.instance.collection('notes');
    List list = new List();
    await query.get().then((querySnapshot) async {
      querySnapshot.docs.forEach((e) => {list.add(e.data())});
    });
    return list;
  }
}
