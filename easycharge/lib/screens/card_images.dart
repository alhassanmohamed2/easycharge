// ignore_for_file: use_key_in_widget_constructors, non_constant_identifier_names, prefer_const_constructors

import 'package:easycharge/screens/AppBar.dart';
import 'package:easycharge/screens/drawer.dart';
import 'package:flutter/material.dart';
import 'package:easycharge/services/database.dart';

class CardImages extends StatefulWidget {
  @override
  State<CardImages> createState() => _CardImagesState();
}

class _CardImagesState extends State<CardImages> {
  List<Widget> Images_date = [
    Container(
        margin: const EdgeInsets.all(20.0),
        child: const Text(
          "Click the Button Below ",
          style: TextStyle(fontSize: 25.0, color: Colors.grey),
        ))
  ];
  @override
  Widget build(BuildContext context) {
    final Map Images = ModalRoute.of(context)?.settings.arguments as Map;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: Appbar(),
        endDrawer: drawer(),
        body: Padding(
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
                child: Column(
              children: Images_date,
            ))),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.show_chart),
          onPressed: () async {
            ImageDatabase images_con = ImageDatabase();
            await images_con.images_func(Images['dates'], Images['images']);
            setState(() {
              if ((images_con.Images_date_con).length == 1) {
                Images_date = [
                  Container(
                      margin: const EdgeInsets.all(20.0),
                      child: const Text(
                        "No Cards Founded",
                        style: TextStyle(fontSize: 25.0, color: Colors.grey),
                      ))
                ];
              } else {
                Images_date = images_con.Images_date_con;
              }
            });
          },
        ));
  }
}
