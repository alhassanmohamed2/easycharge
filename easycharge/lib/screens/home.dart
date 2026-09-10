import 'package:easycharge/screens/AppBar.dart';
import 'package:easycharge/screens/drawer.dart';
import 'package:flutter/material.dart';
import 'package:easycharge/services/options_info.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
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
            padding: const EdgeInsets.fromLTRB(16.0, 100.0, 16.0, 0),
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              children: [
                _buildCarrierCard(context, "Vodafone", "assets/home_screen/vodafone.png"),
                _buildCarrierCard(context, "Orange", "assets/home_screen/orange.png"),
                _buildCarrierCard(context, "We", "assets/home_screen/we.png"),
                _buildCarrierCard(context, "Etisalat", "assets/home_screen/etisalat.png"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCarrierCard(BuildContext context, String carrierName, String assetPath) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: InkWell(
        borderRadius: BorderRadius.circular(24),
        onTap: () {
          Navigator.pushNamed(
            context, 
            "options",
            arguments: card_options[carrierName],
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Image.asset(
            assetPath,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
