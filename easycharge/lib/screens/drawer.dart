import 'package:easycharge/screens/Help.dart';
import 'package:easycharge/screens/about.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class AppDrawer extends StatelessWidget {
  final String screen;

  const AppDrawer({Key? key, this.screen = ""}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/drawer.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 10),
          _buildDrawerItem(
            context,
            icon: Icons.home,
            title: tr('Home'),
            onTap: () {
              Navigator.pop(context); // Close drawer
              if (screen != 'home') {
                Navigator.pushReplacementNamed(context, '/');
              }
            },
          ),
          _buildDrawerItem(
            context,
            icon: Icons.card_giftcard,
            title: tr('Cards'),
            onTap: () {
              Navigator.pop(context);
              if (screen != 'cardImages') {
                Navigator.pushNamed(context, "cardImages");
              }
            },
          ),
          _buildDrawerItem(
            context,
            icon: Icons.help,
            title: tr('Help'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (_) => const Help()));
            },
          ),
          _buildDrawerItem(
            context,
            icon: Icons.help_center,
            title: tr('About'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (_) => const About()));
            },
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
                  onPressed: () async {
                    await context.setLocale(const Locale('en'));
                    Navigator.pop(context);
                  },
                  child: const Text("English", style: TextStyle(color: Colors.white)),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
                  onPressed: () async {
                    await context.setLocale(const Locale('ar'));
                    Navigator.pop(context);
                  },
                  child: const Text("العربية", style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(BuildContext context, {required IconData icon, required String title, required VoidCallback onTap}) {
    return ListTile(
      leading: Icon(icon, size: 28, color: Colors.deepPurple),
      title: Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
      onTap: onTap,
    );
  }
}
