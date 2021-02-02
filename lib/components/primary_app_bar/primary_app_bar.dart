import 'package:flutter/material.dart';

AppBar getPrimaryAppBar(String title) {
  return AppBar(
      iconTheme: IconThemeData(
        color: Colors.white, //change your color here
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
      ));
}
