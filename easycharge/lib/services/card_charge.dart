import 'package:easycharge/services/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

Future<void> chargeCard(
    String cameraExNo, 
    String cardNumber, 
    String code, 
    String dirPath,
    int cardNumberLen, 
    BuildContext context) async {
      
  // Input validation - ensure only digits
  if (cardNumber.length == cardNumberLen && RegExp(r'^[0-9]+$').hasMatch(cardNumber)) {
    String ussdCode = '*$code*$cardNumber#';
    await FlutterPhoneDirectCaller.callNumber(ussdCode);
    
    if (cameraExNo.length == cardNumberLen) {
      ImageDatabase images = ImageDatabase();
      await images.getDataBase();
      await images.openDataBase();
      await images.countImages();
      await images.dataUpdate('$dirPath/${images.no_paths + 1}.jpg');
    }
  } else {
    _showAlertDialog(context);
  }
}

void _showAlertDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text("Error", style: TextStyle(color: Colors.red)),
        content: const Text("The card number is wrong or contains invalid characters."),
        actions: [
          TextButton(
            child: const Text("OK"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      );
    },
  );
}
