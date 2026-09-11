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
      extendBodyBehindAppBar: true,
      endDrawer: const AppDrawer(screen: "home"),
      appBar: const Appbar(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(color: Color(0xFF4365A2),
          image: DecorationImage(
            image: AssetImage('assets/home_screen/home.jpeg'),
            fit: BoxFit.fitHeight,
            alignment: Alignment.bottomCenter, // Keeps blocks anchored to the bottom
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(24.0, 30.0, 24.0, 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tr('Welcome Back!'),
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                        shadows: [Shadow(color: Colors.black87, blurRadius: 10)],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      tr('Choose Your\nCarrier'),
                      style: const TextStyle(
                        fontSize: 34,
                        height: 1.2,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        letterSpacing: 0.5,
                        shadows: [Shadow(color: Colors.black87, blurRadius: 10)],
                      ),
                    ),
                  ],
                ),
              ),
              // Use Wrap with FIXED sizes instead of GridView so the cards don't explode in size!
              Center(
                child: Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  alignment: WrapAlignment.center,
                  children: [
                    _buildCarrierCard(context, "Vodafone", "assets/home_screen/vodafone.png"),
                    _buildCarrierCard(context, "Orange", "assets/home_screen/orange.png"),
                    _buildCarrierCard(context, "We", "assets/home_screen/we.png"),
                    _buildCarrierCard(context, "Etisalat", "assets/home_screen/etisalat.png"),
                  ],
                ),
              ),
              // Push everything to the top, leaving the bottom completely empty for the background image
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCarrierCard(BuildContext context, String carrierId, String assetPath) {
    final option = cardOptions[carrierId];
    final color = option?.primaryColor ?? Colors.black;
    
    return Hero(
      tag: 'carrier_$carrierId',
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, "options", arguments: option);
          },
          borderRadius: BorderRadius.circular(25),
          splashColor: color.withOpacity(0.2),
          highlightColor: color.withOpacity(0.1),
          child: Container(
            width: 140, // Strict maximum width
            height: 160, // Strict maximum height
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.95),
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: color.withOpacity(0.3),
                  blurRadius: 15,
                  spreadRadius: 2,
                  offset: const Offset(0, 8),
                )
              ],
              border: Border.all(color: color.withOpacity(0.4), width: 1.5),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Image.asset(
                      assetPath,
                      fit: BoxFit.contain,
                      width: double.infinity,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: color.withOpacity(0.1),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25),
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      tr(carrierId),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        color: color.withOpacity(0.9),
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
