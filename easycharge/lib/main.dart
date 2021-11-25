import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Text("E47nLy"),
          ),
          drawer: Drawer(),
          body: Center(
            child: SizedBox(
              child: InkWell(
                child: Image.network(
                    "https://logoeps.com/wp-content/uploads/2013/06/vodafone-eps-vector-logo.png"),
              ),
            ),
          ))));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(),
        appBar: AppBar(
          title: Text("E47nLy"),
        ),
        body: Column(children: [
          MaterialButton(
              onPressed: () {},
              child: InkWell(
                child: Image.network(
                    "https://logoeps.com/wp-content/uploads/2013/06/vodafone-eps-vector-logo.png"),
              ))
        ]));
  }
}
