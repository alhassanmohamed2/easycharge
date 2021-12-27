import 'package:easycharge/screens/AppBar.dart';
import 'package:easycharge/screens/drawer.dart';
import 'package:flutter/material.dart';
import 'package:easycharge/services/database.dart';
import 'dart:io';

class CardImages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map Images = ModalRoute.of(context)?.settings.arguments as Map;
    print(Images);
    return Scaffold(
        appBar: Appbar(),
        endDrawer: drawer(),
        body: Padding(
            padding: EdgeInsets.all(7),
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(7),
                  child: Image.file(File(Images['images'][index]['path'])),
                );
              },
              itemCount: Images['images'].length,
            )));
    ;
  }
}
