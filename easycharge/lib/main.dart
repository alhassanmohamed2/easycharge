import 'package:easycharge/screens/card_images.dart';
import 'package:easycharge/translations/codegen_loader.g.dart';
import 'package:flutter/material.dart';
import 'package:easycharge/screens/home.dart';
import 'package:easycharge/screens/options.dart';
import 'package:easy_localization/easy_localization.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      path: 'assets/translations',
      supportedLocales: const [Locale('en'), Locale('ar')],
      fallbackLocale: const Locale('ar'),
      assetLoader: const CodegenLoader(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EasyCharge',
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: Colors.grey[200],
        useMaterial3: true,
      ),
      home: const Home(),
      routes: {
        'options': (context) => const Options(),
        'cardImages': (context) => const CardImages(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
