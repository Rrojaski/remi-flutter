import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/Chinese_Card.model.dart';

String url = "https://remi20200913113417.azurewebsites.net/api/cards";

class API {
  static Future<List<dynamic>> getCards() async {
    var response = await http.get(Uri.encodeFull(url));
    if (response == null) return List();
    return jsonDecode(response.body);
  }
}
