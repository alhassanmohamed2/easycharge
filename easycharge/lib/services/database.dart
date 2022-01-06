// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:io';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter/material.dart';

class ImageDatabase {
  String path = '';
  var database;
  int no_paths = 0;
  var ImagesPaths;
  var dates;
  var date_images;
  var Images_date_con;
  Future getDataBase() async {
    var databasesPath = await getDatabasesPath();
    path = join(databasesPath, 'demo.db');
  }

  Future openDataBase() async {
    database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE IF NOT EXISTS images (id INTEGER PRIMARY KEY, path TEXT,date TEXT)');
    });
  }

  Future dataGet() async {
    ImagesPaths = await database.rawQuery('SELECT path , date FROM images');
    dates = await database.rawQuery('SELECT  date FROM images group by date');
    no_paths = ImagesPaths.length;
  }

  Future dataSpe(var condition) async {
    date_images = await database
        .rawQuery("SELECT  path FROM images where date like '$condition'");
  }

  Future dataUpdate(String path) async {
    DateTime now = DateTime.now();

    String date = "${now.year} - ${now.month} - ${now.day}";

    await database.transaction((txn) async {
      txn.rawInsert('INSERT INTO images(path, date) VALUES("$path", "$date")');
    });
  }

  Future images_func(var dates, var images) async {
    List<Widget> images_con = [
      Container(
          margin: EdgeInsets.all(20.0),
          child: Text(
            "Charged Cards",
            style: TextStyle(fontSize: 25.0, color: Colors.grey),
          ))
    ];
    List<Widget> iamges_tile = [];
    ImageDatabase imagesDates = ImageDatabase();
    var date_images;
    await imagesDates.getDataBase();
    await imagesDates.openDataBase();

    for (int i = 0; i < dates.length; i++) {
      await imagesDates.dataSpe(dates[i]['date']);
      date_images = imagesDates.date_images;
      if (iamges_tile.isNotEmpty) {
        iamges_tile.clear();
      }
      for (int j = 0; j < date_images.length; j++) {
        iamges_tile.add(
          Image.file(File(date_images[j]['path'])),
        );
        iamges_tile.add(Container(margin: EdgeInsets.all(10)));
      }

      images_con.add(Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(10)),
          padding: const EdgeInsets.all(25),
          margin: EdgeInsets.all(5),
          child: ExpansionTile(
            title: Text("${dates[i]['date']}"),
            children: [
              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemCount: iamges_tile.length,
                itemBuilder: (context, index) {
                  return iamges_tile[index];
                },
              ),
            ],
          )));
    }

    Images_date_con = images_con;
  }
}