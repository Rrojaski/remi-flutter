import 'package:REMI/components/primary_app_bar/primary_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:REMI/api/api.dart';

class AddCardScreen extends StatefulWidget {
  @override
  createState() => new AddCardState();
}

class AddCardState extends State<AddCardScreen> {
  @override
  void initState() {
    super.initState();
  }

  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final characterControler = TextEditingController();
  final piyinControler = TextEditingController();
  final meaningControler = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    characterControler.dispose();
    piyinControler.dispose();
    meaningControler.dispose();
    super.dispose();
  }

  /// Clear all text field values
  clearControllers() {
    characterControler.clear();
    piyinControler.clear();
    meaningControler.clear();
  }

  /// All text fields must be filled in
  bool hasRequriedFields() {
    return characterControler.text.isNotEmpty &&
        piyinControler.text.isNotEmpty &&
        meaningControler.text.isNotEmpty;
  }

  /// Submit form to api
  addCard() async {
    if (!hasRequriedFields()) return;
    bool addSuccess = await API.addCard(
        characterControler.text, piyinControler.text, meaningControler.text);

    if (addSuccess) {
      clearControllers();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getPrimaryAppBar("Add Card"),
        body: Container(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            width: double.infinity,
            height: 450.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Column(children: <Widget>[
                  Container(
                      margin: const EdgeInsets.only(bottom: 25),
                      child: TextFormField(
                        controller: characterControler,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          labelText: 'Character',
                        ),
                      )),
                  Container(
                      margin: const EdgeInsets.only(bottom: 25),
                      child: TextFormField(
                        controller: piyinControler,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          labelText: 'Piyin',
                        ),
                      )),
                  Container(
                      margin: const EdgeInsets.only(bottom: 25),
                      child: TextFormField(
                        controller: meaningControler,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          labelText: 'Meaning',
                        ),
                      )),
                  RaisedButton(
                    color: Colors.white,
                    onPressed: () {
                      addCard();
                    },
                    child: Text("Submit"),
                  ),
                ]),
              ],
            ),
          ),
        ));
  }
}
