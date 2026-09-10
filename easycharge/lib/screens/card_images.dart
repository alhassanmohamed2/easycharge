import 'dart:io';
import 'package:easycharge/screens/AppBar.dart';
import 'package:easycharge/screens/drawer.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easycharge/services/database.dart';

class CardImages extends StatefulWidget {
  const CardImages({Key? key}) : super(key: key);

  @override
  State<CardImages> createState() => _CardImagesState();
}

class _CardImagesState extends State<CardImages> {
  final ImageDatabase _db = ImageDatabase();
  bool _isLoading = true;
  List<Widget> _imageWidgets = [];

  @override
  void initState() {
    super.initState();
    _loadImages();
  }

  Future<void> _loadImages() async {
    setState(() => _isLoading = true);
    await _db.getDataBase();
    await _db.openDataBase();
    await _db.dataGet();

    List<Widget> widgets = [
      Container(
        margin: const EdgeInsets.all(20.0),
        child: const Text(
          "Charged Cards",
          style: TextStyle(fontSize: 25.0, color: Colors.grey, fontWeight: FontWeight.bold),
        )
      )
    ];

    if (_db.dates.isEmpty) {
      widgets.add(
        Container(
          margin: const EdgeInsets.all(20.0),
          child: const Text(
            "No Cards Found", // Fixed grammar
            style: TextStyle(fontSize: 20.0, color: Colors.grey),
          )
        )
      );
      widgets.add(
        Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.fromLTRB(5, 40, 5, 10),
          child: Image.asset('assets/error.gif'),
        )
      );
    } else {
      widgets.add(
        Align(
          alignment: Alignment.centerRight,
          child: IconButton(
            icon: const Icon(Icons.delete, color: Colors.red, size: 30),
            onPressed: _showDeleteConfirmation,
          ),
        )
      );

      for (int i = 0; i < _db.dates.length; i++) {
        String date = _db.dates[i]['date'];
        await _db.dataSpe(date);
        var dateImages = List.from(_db.date_images);

        widgets.add(
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(16)
            ),
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
            child: ExpansionTile(
              title: Text(date, style: const TextStyle(fontWeight: FontWeight.bold)),
              children: [
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: dateImages.length,
                  itemBuilder: (context, index) {
                    File imgFile = File(dateImages[index]["path"]);
                    if (!imgFile.existsSync()) return const SizedBox();
                    
                    return Container(
                      margin: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.file(imgFile),
                      ),
                    );
                  },
                ),
              ]
            )
          )
        );
      }
    }

    setState(() {
      _imageWidgets = widgets;
      _isLoading = false;
    });
  }

  void _showDeleteConfirmation() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: const Text("Delete All Images"),
          content: const Text("Are you sure you want to delete all card images?"), // Fixed grammar
          actions: [
            TextButton(
              child: const Text("Yes", style: TextStyle(color: Colors.red)),
              onPressed: () async {
                Navigator.of(context).pop();
                setState(() => _isLoading = true);
                await _db.delete_images();
                await _loadImages();
              },
            ),
            TextButton(
              child: const Text("No"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Appbar(),
      endDrawer: const AppDrawer(screen: 'cardImages'),
      body: _isLoading 
        ? const Center(child: CircularProgressIndicator())
        : Padding(
            padding: const EdgeInsets.all(12),
            child: SingleChildScrollView(
              child: Column(
                children: _imageWidgets,
              ),
            ),
          ),
    );
  }
}
