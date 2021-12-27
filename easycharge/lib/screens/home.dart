import 'package:easycharge/screens/AppBar.dart';
import 'package:easycharge/screens/drawer.dart';
import 'package:flutter/material.dart';
import 'package:easycharge/services/options_info.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/home_screen/background.gif"),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            endDrawer: drawer(),
            appBar: Appbar(),
            body: SafeArea(
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
                              onPressed: () {
                                Navigator.pushNamed(context, "options",
                                    arguments: card_options["Vodafone"]);
                              },
                              child: Image.asset(
                                  "assets/home_screen/vodafone.png"),
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(50)))),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, "options",
                                    arguments: card_options["Orange"]);
                              },
                              child:
                                  Image.asset("assets/home_screen/orange.png"),
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(50)))),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, "options",
                                    arguments: card_options["We"]);
                              },
                              child: Image.asset("assets/home_screen/we.png"),
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(50)))),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, "options",
                                    arguments: card_options["Etisalat"]);
                              },
                              child: Image.asset(
                                  "assets/home_screen/etisalat.png"),
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(50)))),
                        ])))));
  }
}
