import 'package:flutter/material.dart';

class CarrierOption {
  final String id;
  final String title;
  final List<String> items;
  final int cardNumberLen;
  final List<String> codes;
  final String imagePath;
  final Color primaryColor;
  final Color inputColor;
  final Color labelColor;
  final Color hintColor;

  const CarrierOption({
    required this.id,
    required this.title,
    required this.items,
    required this.cardNumberLen,
    required this.codes,
    required this.imagePath,
    required this.primaryColor,
    required this.inputColor,
    required this.labelColor,
    required this.hintColor,
  });
}
