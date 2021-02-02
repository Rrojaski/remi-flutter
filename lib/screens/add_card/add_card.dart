import 'package:REMI/components/primary_app_bar/primary_app_bar.dart';
import 'package:flutter/material.dart';

class AddCardScreen extends StatefulWidget {
  @override
  createState() => new AddCardState();
}

class AddCardState extends State<AddCardScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getPrimaryAppBar("Add Card"),
      body: Container(),
    );
  }
}
