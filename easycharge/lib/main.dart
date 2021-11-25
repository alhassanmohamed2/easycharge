// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';

void main() {
  var width2 = 2;
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          drawer: const Drawer(),
          appBar: AppBar(
            title: const Text("E47nLy"),
          ),
          backgroundColor: const Image(
            image: AssetImage("assets/back.jpg"),
          ).color,
          body: Container(
              child: GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10),
                  children: [
                ElevatedButton(
                    onPressed: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                            image: AssetImage("assets/vodafone1.png"),
                            fit: BoxFit.cover),
                        border: Border.all(width: 5, color: Colors.red),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Image(
                          image: AssetImage("assets/vodafone1.png")),
                      height: 300,
                      width: 300,
                    ),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100)))),
                ElevatedButton(
                    onPressed: () {},
                    child: Container(
                      decoration: BoxDecoration(
                          image: const DecorationImage(
                              image: AssetImage("assets/orange.png"),
                              fit: BoxFit.cover),
                          border: Border.all(
                              color: Colors.deepOrangeAccent, width: 5),
                          borderRadius: BorderRadius.circular(50)),
                      child:
                          const Image(image: AssetImage("assets/orange.png")),
                      height: 300,
                      width: 300,
                    ),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100)))),
                ElevatedButton(
                    onPressed: () {},
                    child: Container(
                      decoration: BoxDecoration(
                          image: const DecorationImage(
                              image: AssetImage("assets/we.png"),
                              fit: BoxFit.contain),
                          border:
                              Border.all(color: Colors.deepPurple, width: 5),
                          borderRadius: BorderRadius.circular(50)),
                      child: const Image(image: AssetImage("assets/we.png")),
                      height: 270,
                      width: 260,
                    ),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100)))),
                ElevatedButton(
                    onPressed: () {},
                    child: Container(
                      decoration: BoxDecoration(
                          image: const DecorationImage(
                              image: AssetImage("assets/Etisalat.jpg"),
                              fit: BoxFit.fill),
                          border:
                              Border.all(color: Colors.lime.shade600, width: 7),
                          borderRadius: BorderRadius.circular(50)),
                      child:
                          const Image(image: AssetImage("assets/Etisalat.jpg")),
                      height: 300,
                      width: 350,
                    ),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100)))),
              ])))));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
