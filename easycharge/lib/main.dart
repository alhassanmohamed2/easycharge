import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AboutPage(),
    );
  }
}

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const Drawer(),
      body: ListView(
        children: [
          Column(
            children: [
              Padding(padding: EdgeInsets.all(4)),
              Container(
                padding: EdgeInsets.all(7),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.purple.shade300),
                    color: Colors.purple.shade100),
                child: Row(
                  children: [
                    Container(
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage("assets/mohamed.jfif"),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.all(6),
                        child: Text("Mohamed Mohamed Atef Amhawy",
                            style:
                                TextStyle(fontSize: 18.0, color: Colors.black)))
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.all(5)),
              Container(
                padding: EdgeInsets.all(7),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.purple.shade300),
                    color: Colors.purple.shade100),
                child: Row(
                  children: [
                    Container(
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage("assets/alhassan.jfif"),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.all(6),
                        child: Text("Alhassan Mohamed",
                            style:
                                TextStyle(fontSize: 18.0, color: Colors.black)))
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.all(5)),
              Container(
                padding: EdgeInsets.all(7),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.purple.shade300),
                    color: Colors.purple.shade100),
                child: Row(
                  children: [
                    Container(
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage("assets/mahmoud.jfif"),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.all(6),
                        child: Text("Mahmoud Nagy Elsayed",
                            style:
                                TextStyle(fontSize: 18.0, color: Colors.black)))
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.all(5)),
              Container(
                padding: EdgeInsets.all(7),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.purple.shade300),
                    color: Colors.purple.shade100),
                child: Row(
                  children: [
                    Container(
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage("assets/sara.jfif"),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.all(6),
                        child: Text("Sara Abdulah Nassar",
                            style:
                                TextStyle(fontSize: 18.0, color: Colors.black)))
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.all(5)),
              Container(
                padding: EdgeInsets.all(7),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.purple.shade300),
                    color: Colors.purple.shade100),
                child: Row(
                  children: [
                    Container(
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage("assets/alaa.jfif"),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.all(6),
                        child: Text("Alaa Mohamed Mohamed Mahdy",
                            style:
                                TextStyle(fontSize: 18.0, color: Colors.black)))
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.all(5)),
              Container(
                padding: EdgeInsets.all(7),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.purple.shade300),
                    color: Colors.purple.shade100),
                child: Row(
                  children: [
                    Container(
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage("assets/doaa_mustfa.jfif"),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.all(6),
                        child: Text("Duaa Mostafa Abdulbaset",
                            style:
                                TextStyle(fontSize: 18.0, color: Colors.black)))
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.all(5)),
              Container(
                padding: EdgeInsets.all(7),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.purple.shade300),
                    color: Colors.purple.shade100),
                child: Row(
                  children: [
                    Container(
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage("assets/doaa_gamal.jfif"),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.all(6),
                        child: Text("Doaa Gamal Eltohamy",
                            style:
                                TextStyle(fontSize: 18.0, color: Colors.black)))
                  ],
                ),
              ),
            ],
          ),
          Card(
            child: Text(
              "This program helps you to charge the cards with ease, by placing the 15-digit charging number on the rectangle that appears to you when you click on the camera, and the program will charge the card immediately ",
              style: TextStyle(color: Colors.white70, fontSize: 18),
            ),
            margin: EdgeInsets.all(15),
            elevation: 15,
            color: Colors.purple.shade300,
          )
        ],
      ),
    );
  }
}
