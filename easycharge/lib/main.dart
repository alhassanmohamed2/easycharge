import 'package:flutter/material.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('doaa '),
          //leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () {}),
        ),
        drawer: Drawer(
            child: Column(
          children: [
            Container(
              color: Colors.deepPurple,
              padding: EdgeInsets.all(110),
              margin: EdgeInsets.only(
                bottom: 10,
              ),
            ),
            Center(
                child: MaterialButton(
              onPressed: () {},
              child: Row(
                children: [
                  Icon(Icons.home),
                  Padding(padding: EdgeInsets.all(5)),
                  Text(
                    "Home Page",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              padding: EdgeInsets.only(bottom: 30, left: 30, top: 30),
              elevation: 20,
              splashColor: Colors.deepPurple,
            )),
            Center(
                child: MaterialButton(
              onPressed: () {},
              child: Row(
                children: [
                  Icon(Icons.help),
                  Padding(padding: EdgeInsets.all(5)),
                  Text(
                    "Help",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              padding: EdgeInsets.only(bottom: 30, left: 30, top: 30),
              elevation: 20,
              splashColor: Colors.deepPurple,
            )),
            Center(
                child: MaterialButton(
              onPressed: () {},
              child: Row(
                children: [
                  Icon(Icons.help_center),
                  Padding(padding: EdgeInsets.all(5)),
                  Text(
                    "About",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal),
                  )
                ],
              ),
              padding: EdgeInsets.only(bottom: 30, left: 30, top: 30),
              elevation: 20,
              splashColor: Colors.deepPurple,
            ))
          ],
        )));
  }
}
