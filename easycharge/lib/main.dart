import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  get index => null;
  TextEditingController notes = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Helppage(),
    );
  }
}

class Helppage extends StatelessWidget {
  get notes => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        drawer: Drawer(),
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Container(
                  // ignore: prefer_const_constructors
                  child: Text(
                    "step1:first choose your company",
                    style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic),
                  ),

                  width: double.infinity,
                  height: 200.0,
                  margin: EdgeInsets.all(10.0),
                  padding: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                      color: Colors.lightBlue[200],
                      border: Border.all(color: Colors.brown, width: 5),
                      borderRadius: BorderRadius.circular(25.0),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black,
                            blurRadius: 15.0,
                            spreadRadius: 1.2)
                      ]),
                ),
                Container(
                  // ignore: prefer_const_constructors
                  child: Text(
                    "step2:second make your card as big as enough to the camera screen",
                    style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic),
                  ),

                  width: double.infinity,
                  height: 200.0,
                  margin: EdgeInsets.all(10.0),
                  padding: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                      color: Colors.lightBlue[900],
                      border: Border.all(color: Colors.brown, width: 5),
                      borderRadius: BorderRadius.circular(25.0),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black,
                            blurRadius: 15.0,
                            spreadRadius: 1.2)
                      ]),
                ),
                Container(
                  // ignore: prefer_const_constructors
                  child: Text(
                    "step3:take the pic without shaking your hands",
                    style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic),
                  ),

                  width: double.infinity,
                  height: 200.0,
                  margin: EdgeInsets.all(10.0),
                  padding: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                      color: Colors.cyan,
                      border: Border.all(color: Colors.brown, width: 5),
                      borderRadius: BorderRadius.circular(25.0),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black,
                            blurRadius: 15.0,
                            spreadRadius: 1.2)
                      ]),
                ),
                Container(
                  // ignore: prefer_const_constructors
                  child: Text(
                    "step4:highlight the card number and bress ok",
                    style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic),
                  ),

                  width: double.infinity,
                  height: 200.0,
                  margin: EdgeInsets.all(10.0),
                  padding: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                      color: Colors.cyan[800],
                      border: Border.all(color: Colors.brown, width: 5),
                      borderRadius: BorderRadius.circular(25.0),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black,
                            blurRadius: 15.0,
                            spreadRadius: 1.2)
                      ]),
                ),
                Container(
                  // ignore: prefer_const_constructors
                  child: Text(
                    "step5:",
                    style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic),
                  ),

                  width: double.infinity,
                  height: 200.0,
                  margin: EdgeInsets.all(10.0),
                  padding: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                      color: Colors.blue[200],
                      border: Border.all(color: Colors.brown, width: 5),
                      borderRadius: BorderRadius.circular(25.0),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black,
                            blurRadius: 15.0,
                            spreadRadius: 1.2)
                      ]),
                ),
                Container(
                  // ignore: prefer_const_constructors
                  child: Text(
                    "step6:",
                    style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic),
                  ),

                  width: double.infinity,
                  height: 200.0,
                  margin: EdgeInsets.all(10.0),
                  padding: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                      color: Colors.cyan[200],
                      border: Border.all(color: Colors.brown, width: 5),
                      borderRadius: BorderRadius.circular(25.0),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black,
                            blurRadius: 15.0,
                            spreadRadius: 1.2)
                      ]),
                ),
                Text(
                  "please ,if you have any notes or problems write it here kindly ",
                  style: TextStyle(fontSize: 50, fontStyle: FontStyle.normal),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: " let your notes here",
                    hintMaxLines: 7,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide:
                            BorderSide(color: Colors.blueAccent, width: 3)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide:
                            BorderSide(color: Colors.lightBlue, width: 3)),
                  ),
                  controller: notes,
                ),
                ElevatedButton(
                    onPressed: () {
                      print(notes.text);
                    },
                    child: Text("send"))
              ],
            )));
  }
}
