import 'package:flutter/material.dart';
import 'package:easycharge/models/carrier_option.dart';

final Map<String, CarrierOption> cardOptions = {
  "Vodafone": CarrierOption(
    id: "Vodafone",
    title: "خدمات فودافون",
    items: [
      "لشحن كارت عادي/فكه",
      "لشحن الكارت دقائق لكل الشبكات ",
      "لشحن فلكسات"
    ],
    cardNumberLen: 16,
    codes: ['858', '858*1', '858*2'],
    imagePath: "assets/options_background/vodafone.jpg",
    primaryColor: Colors.red,
    inputColor: Colors.white,
    labelColor: Colors.white,
    hintColor: Colors.white,
  ),
  "Etisalat": CarrierOption(
    id: "Etisalat",
    title: "خدمات اتصالات",
    items: [
      "لشحن كارت عادي /فكه",
      "لشحن كارت دقائق لكل الشبكات",
      "لشحن ميكسات"
    ],
    cardNumberLen: 15,
    codes: ['556', '556*2', '556*1'],
    imagePath: "assets/options_background/Eitsaat.jpg",
    primaryColor: Colors.green,
    inputColor: Colors.greenAccent,
    labelColor: Colors.green,
    hintColor: Colors.greenAccent,
  ),
  "Orange": CarrierOption(
    id: "Orange",
    title: "خدمات أورانج",
    items: [
      "لشحن كارت عادي /فكه", 
      "لشحن كارت اكستر"
    ],
    cardNumberLen: 14,
    codes: ['102', '102'],
    imagePath: "assets/options_background/orange.jpg",
    primaryColor: Colors.orange,
    inputColor: Colors.white,
    labelColor: Colors.yellow,
    hintColor: Colors.orange,
  ),
  "We": CarrierOption(
    id: "We",
    title: "خدمات وى",
    items: [
      "لشحن كارت عادي/فكه", 
      "لشحن وحدات ", 
      "لشحن ميجابايت انترنت"
    ],
    cardNumberLen: 16,
    codes: ['555', '566', '599'],
    imagePath: "assets/options_background/We.jpg",
    primaryColor: Colors.purple,
    inputColor: Colors.purpleAccent,
    labelColor: Colors.white,
    hintColor: Colors.white,
  )
};

final Map<String, List<String>> team_members = {
  "names": [
    'Mohamed Mohamed Atef Amhawy',
    'Alhassan Mohamed Abd El-Aziz',
    'Mahmoud Nagy Elsayed',
    'Sara Abdulah Nassar',
    'Alaa Mohamed Mohamed',
    'Duaa Mustafa Abdulbaset',
    'Doaa Gamal Eltohamy'
  ],
  'personal_image': [
    'assets/team_member/mohamed.jfif',
    'assets/team_member/alhassan.jfif',
    'assets/team_member/mahmoud.jfif',
    'assets/team_member/sara.jfif',
    'assets/team_member/alaa.jfif',
    'assets/team_member/doaa_m.jfif',
    'assets/team_member/doaa_g.jfif'
  ]
};

const List<String> steps = [
  "first",
  "second",
  "third",
  "fourth",
  "fifth",
  "sixthly",
  "seventh",
  "eighth",
];
