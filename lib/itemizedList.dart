import 'package:flutter/material.dart';

class ItemizedList extends StatelessWidget {
  List<String> itemList = ["apples", "grapes", "oranges"];
  final Function addToList;
  ItemizedList(this.itemList, this.addToList);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(20),
        width: double.infinity,
        child: Column(children: <Widget>[
          ...itemList.map((item) {
            return Text(item);
          }).toList(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(width: 100, child: Text("Account 12345")),
              Flexible(child: TextFormField(keyboardType: TextInputType.text))
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(width: 100, child: Text("Amount Found Not Here")),
              Flexible(child: TextFormField(keyboardType: TextInputType.number))
            ],
          ),
          Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              child: Text("Percentage Calculator Calculator")),
          RaisedButton(
            child: Text("Add"),
            onPressed: () => this.addToList("Nissan Quest"),
          ),
        ]));
  }
}
