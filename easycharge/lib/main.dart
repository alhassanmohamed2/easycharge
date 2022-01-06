import 'package:easycharge/screens/card_images.dart';
import 'package:easycharge/translations/codegen_loader.g.dart';

import 'package:flutter/material.dart';
import 'package:easycharge/screens/home.dart';
import 'package:easycharge/screens/options.dart';
import 'package:easy_localization/easy_localization.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(MaterialApp(
    home: EasyLocalization(
        path: 'assets/translations',
        supportedLocales: [Locale('en'), Locale('ar')],
        fallbackLocale: Locale('en'),
        assetLoader: CodegenLoader(),
        child: Home()),
    routes: {
      'options': (context) => Options(),
      'cardImages': (context) => CardImages()
    },
    debugShowCheckedModeBanner: false,
  ));
}
