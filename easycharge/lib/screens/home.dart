import 'package:easycharge/screens/AppBar.dart';
import 'package:easycharge/screens/drawer.dart';
import 'package:flutter/material.dart';
import 'package:easycharge/services/options_info.dart';
import 'package:easy_localization/easy_localization.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      extendBodyBehindAppBar: true,
      endDrawer: const AppDrawer(screen: "home"),
      appBar: const Appbar(),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/home_screen/home.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(7.0, 120.0, 7.0, 0),
            child: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
              ),
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "options", arguments: cardOptions["Vodafone"]);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  child: Image.asset("assets/home_screen/vodafone.png"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "options", arguments: cardOptions["Orange"]);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  child: Image.asset("assets/home_screen/orange.png"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "options", arguments: cardOptions["We"]);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  child: Image.asset("assets/home_screen/we.png"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "options", arguments: cardOptions["Etisalat"]);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  child: Image.asset("assets/home_screen/etisalat.png"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
