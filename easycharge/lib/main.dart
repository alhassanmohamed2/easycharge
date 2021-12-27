import 'package:easycharge/screens/card_images.dart';
import 'package:flutter/material.dart';
import 'package:easycharge/screens/home.dart';
import 'package:easycharge/screens/options.dart';

void main() {
  runApp(MaterialApp(
    routes: {
      'options': (context) => Options(),
      'cardImages': (context) => CardImages()
    },
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}
