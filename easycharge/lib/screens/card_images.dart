import 'dart:io';
import 'package:easycharge/screens/AppBar.dart';
import 'package:easycharge/screens/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
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
  String? _errorMessage;
  List<Map<String, dynamic>> _groupedCards = [];

  @override
  void initState() {
    super.initState();
    _loadImages();
  }

  Future<void> _loadImages() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    if (kIsWeb) {
      setState(() {
        _isLoading = false;
        _errorMessage = tr("Database features are not supported on the Web browser.");
      });
      return;
    }

    try {
      await _db.getDataBase();
      await _db.openDataBase();
      await _db.dataGet();

      List<Map<String, dynamic>> loadedData = [];

      for (int i = 0; i < _db.dates.length; i++) {
        String date = _db.dates[i]['date'];
        await _db.dataSpe(date);
        loadedData.add({
          "date": date,
          "images": List.from(_db.date_images)
        });
      }

      setState(() {
        _groupedCards = loadedData;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
        _errorMessage = "Failed to load database: ${e.toString()}";
      });
    }
  }

  void _showDeleteConfirmation() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          title: Text(tr("Clear History"), style: const TextStyle(fontWeight: FontWeight.bold)),
          content: Text(tr("Are you sure you want to delete all scanned card images?")),
          actions: [
            TextButton(
              child: Text(tr("Cancel"), style: TextStyle(color: Colors.grey.shade600)),
              onPressed: () => Navigator.of(context).pop(),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red.shade400,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: Text(tr("Delete All")),
              onPressed: () async {
                Navigator.of(context).pop();
                setState(() => _isLoading = true);
                try {
                  await _db.delete_images();
                } catch (e) {
                  // handle
                }
                await _loadImages();
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
      floatingActionButton: _groupedCards.isNotEmpty
          ? FloatingActionButton.extended(
              onPressed: _showDeleteConfirmation,
              backgroundColor: Colors.red.shade50,
              icon: Icon(Icons.delete_sweep_rounded, color: Colors.red.shade400),
              label: Text(tr("Clear All"), style: TextStyle(color: Colors.red.shade400, fontWeight: FontWeight.bold)),
            )
          : null,
      body: _isLoading 
        ? const Center(child: CircularProgressIndicator())
        : _errorMessage != null
            ? Center(
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.red.shade50,
                          shape: BoxShape.circle
                        ),
                        child: Icon(Icons.error_outline_rounded, color: Colors.red.shade400, size: 60),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        _errorMessage!, 
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16, color: Colors.grey.shade800, height: 1.5)
                      ),
                    ],
                  ),
                ),
              )
            : _groupedCards.isEmpty 
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.credit_card_off_rounded, size: 80, color: Colors.grey.shade300),
                        const SizedBox(height: 16),
                        Text(
                          tr("No Cards Scanned"),
                          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.grey.shade400),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          tr("Scanned recharge cards will appear here"),
                          style: TextStyle(color: Colors.grey.shade500),
                        )
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.only(top: 16, bottom: 100, left: 16, right: 16),
                    itemCount: _groupedCards.length,
                    itemBuilder: (context, index) {
                      final group = _groupedCards[index];
                      return Card(
                        margin: const EdgeInsets.only(bottom: 16),
                        elevation: 2,
                        shadowColor: Colors.black.withOpacity(0.05),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        child: Theme(
                          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                          child: ExpansionTile(
                            initiallyExpanded: index == 0,
                            iconColor: Theme.of(context).colorScheme.primary,
                            title: Text(
                              group['date'], 
                              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16)
                            ),
                            children: [
                              ListView.builder(
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: group['images'].length,
                                itemBuilder: (context, imgIndex) {
                                  File imgFile = File(group['images'][imgIndex]["path"]);
                                  if (!imgFile.existsSync()) return const SizedBox();
                                  
                                  return Container(
                                    margin: const EdgeInsets.only(bottom: 16),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.08),
                                          blurRadius: 10,
                                          offset: const Offset(0, 4)
                                        )
                                      ]
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(16),
                                      child: Image.file(imgFile, fit: BoxFit.cover),
                                    ),
                                  );
                                },
                              ),
                            ]
                          ),
                        )
                      );
                    },
                  ),
    );
  }
}
