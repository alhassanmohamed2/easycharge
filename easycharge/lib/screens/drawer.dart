import 'package:easycharge/screens/Help.dart';
import 'package:easycharge/screens/about.dart';
import 'package:easycharge/screens/home.dart';
import 'package:easycharge/services/database.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class drawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
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
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            );
          },
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
          onPressed: () async {
            var Images = [];
            var dates = [];
            ImageDatabase images = ImageDatabase();
            await images.getDataBase();
            await images.openDataBase();
            await images.dataGet();
            Images = images.ImagesPaths;
            dates = images.dates;
            var Images_no = images.no_paths;
            Navigator.pushNamed(context, "cardImages", arguments: {
              'images': Images,
              'images_no': Images_no,
              'dates': dates
            });
          },
          child: Row(
            children: [
              Icon(Icons.card_giftcard),
              Padding(padding: EdgeInsets.all(5)),
              Text(
                "Charged Cards",
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
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Help()),
            );
          },
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
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => About()),
            );
          },
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
        )),
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.deepPurple,
                ),
                onPressed: () async {
                  await context.setLocale(
                    Locale('en'),
                  );
                  Navigator.pop(context);
                },
                child: Text("English")),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.deepPurple,
                ),
                onPressed: () async {
                  await context.setLocale(
                    Locale('ar'),
                  );
                  Navigator.pop(context);
                },
                child: Text("العربية"))
          ],
        )
      ],
    ));
  }
}
