import 'package:easycharge/screens/Help.dart';
import 'package:easycharge/screens/about.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class AppDrawer extends StatelessWidget {
  final String screen;

  const AppDrawer({Key? key, this.screen = ""}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    
    return Drawer(
      backgroundColor: colorScheme.background,
      child: SafeArea(
        child: Column(
          children: [
            Container(
              height: 180,
              width: double.infinity,
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                image: const DecorationImage(
                  image: AssetImage('assets/drawer.jpg'),
                  fit: BoxFit.cover,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  )
                ],
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withOpacity(0.6),
                      Colors.transparent,
                    ],
                  ),
                ),
                alignment: Alignment.bottomLeft,
                padding: const EdgeInsets.all(20),
                child: const Text(
                  'EasyCharge',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                physics: const BouncingScrollPhysics(),
                children: [
                  _buildDrawerItem(
                    context,
                    icon: Icons.home_rounded,
                    title: tr('Home'),
                    isSelected: screen == 'home',
                    onTap: () {
                      Navigator.pop(context);
                      if (screen != 'home') Navigator.pushReplacementNamed(context, '/');
                    },
                  ),
                  _buildDrawerItem(
                    context,
                    icon: Icons.credit_card_rounded,
                    title: tr('Cards'),
                    isSelected: screen == 'cardImages',
                    onTap: () {
                      Navigator.pop(context);
                      if (screen != 'cardImages') Navigator.pushReplacementNamed(context, 'cardImages');
                    },
                  ),
                  _buildDrawerItem(
                    context,
                    icon: Icons.help_outline_rounded,
                    title: tr('Help'),
                    isSelected: screen == 'help',
                    onTap: () {
                      Navigator.pop(context);
                      if (screen != 'help') {
                        Navigator.push(context, MaterialPageRoute(builder: (_) => const Help()));
                      }
                    },
                  ),
                  _buildDrawerItem(
                    context,
                    icon: Icons.info_outline_rounded,
                    title: tr('About'),
                    isSelected: screen == 'about',
                    onTap: () {
                      Navigator.pop(context);
                      if (screen != 'about') {
                        Navigator.push(context, MaterialPageRoute(builder: (_) => const About()));
                      }
                    },
                  ),
                ],
              ),
            ),
            const Divider(indent: 20, endIndent: 20),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: _buildLangButton(
                      context, 
                      title: "English", 
                      locale: const Locale('en'),
                      isSelected: context.locale.languageCode == 'en',
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildLangButton(
                      context, 
                      title: "العربية", 
                      locale: const Locale('ar'),
                      isSelected: context.locale.languageCode == 'ar',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(BuildContext context, {
    required IconData icon, 
    required String title, 
    required bool isSelected,
    required VoidCallback onTap
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        tileColor: isSelected ? colorScheme.primary.withOpacity(0.1) : Colors.transparent,
        leading: Icon(
          icon, 
          size: 26, 
          color: isSelected ? colorScheme.primary : Colors.grey.shade600
        ),
        title: Text(
          title, 
          style: TextStyle(
            fontSize: 16, 
            fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
            color: isSelected ? colorScheme.primary : Colors.grey.shade800,
          ),
        ),
        onTap: onTap,
      ),
    );
  }

  Widget _buildLangButton(BuildContext context, {
    required String title, 
    required Locale locale,
    required bool isSelected,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    return InkWell(
      onTap: () async {
        await context.setLocale(locale);
        Navigator.pop(context);
      },
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? colorScheme.primary : Colors.grey.shade300,
            width: isSelected ? 2 : 1,
          ),
          color: isSelected ? colorScheme.primary.withOpacity(0.05) : Colors.transparent,
        ),
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? colorScheme.primary : Colors.grey.shade600,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
