// ignore_for_file: avoid_unnecessary_containers
// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MainScreen()));
}

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Image.asset("assets/back.jpg").color,
        endDrawer: Drawer(),
        appBar: AppBar(
          title: const Text("E47nLy"),
          centerTitle: true,
        ),
        body: Container(
            margin: EdgeInsets.all(50),
            padding: EdgeInsets.all(50),
            child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20),
                children: [
                  ElevatedButton(
                      onPressed: () {},
                      child: Image.asset("assets/vodafone1.png"),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)))),
                  ElevatedButton(
                      onPressed: () {},
                      child: Image.asset("assets/orange.png"),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)))),
                  ElevatedButton(
                      onPressed: () {},
                      child: Image.asset("assets/we.png"),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)))),
                  ElevatedButton(
                      onPressed: () {},
                      child: Image.asset("assets/Etisalat.jpg"),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)))),
                ])));
  }
}
