import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class Appbar extends StatelessWidget implements PreferredSizeWidget {
  const Appbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[Colors.purpleAccent, Colors.blue],
          ),
        ),
      ),
      title: Text(tr('basic'), style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      centerTitle: true,
      iconTheme: const IconThemeData(color: Colors.white),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
