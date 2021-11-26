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
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/back.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            endDrawer: Drawer(),
            appBar: AppBar(
              title: const Text("E47nLy"),
              centerTitle: true,
            ),
            body: SafeArea(
                child: Container(
                    child: Padding(
                        padding: const EdgeInsets.fromLTRB(5.0, 120.0, 5.0, 0),
                        child: GridView(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
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
                                          borderRadius:
                                              BorderRadius.circular(50)))),
                              ElevatedButton(
                                  onPressed: () {},
                                  child: Image.asset("assets/orange.png"),
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50)))),
                              ElevatedButton(
                                  onPressed: () {},
                                  child: Image.asset("assets/we.png"),
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50)))),
                              ElevatedButton(
                                  onPressed: () {},
                                  child: Image.asset("assets/Etisalat.jpg"),
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50)))),
                            ]))))));
  }
}
