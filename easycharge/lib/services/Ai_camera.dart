import 'dart:async';
import 'package:easycharge/services/database.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobile_vision_2/flutter_mobile_vision_2.dart';
import 'package:path_provider/path_provider.dart';

class Ai_cam {
  String platformVersion = 'Unknown';
  int? cameraOcr = FlutterMobileVision.CAMERA_BACK;
  Size? previewOcr;
  List<OcrText> textsOcr = [];
  var cardnumber = "";
  var images = ImageDatabase();
  Future<void> initPlatformState() async {
    String platformVersion;
    try {
      platformVersion = await FlutterMobileVision.platformVersion ??
          'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    platformVersion = platformVersion;
  }

  Future<Null> ExtractNumber() async {
    FlutterMobileVision.start().then((previewSizes) => (() {
          previewOcr = previewSizes[cameraOcr]!.first;
        }));
    List<OcrText> texts = [];
    Size _scanpreviewOcr = previewOcr ?? FlutterMobileVision.PREVIEW;
    await images.getDataBase();
    await images.openDataBase();
    await images.dataGet();
    var no = images.no_paths;
    var extDir = await getExternalStorageDirectory();
    var dirPath = extDir?.path;
    try {
      texts = await FlutterMobileVision.read(
          autoFocus: true,
          imagePath: '$dirPath/${no + 1}.jpg',
          preview: _scanpreviewOcr,
          waitTap: true,
          multiple: false,
          camera: cameraOcr ?? FlutterMobileVision.CAMERA_BACK,
          fps: 2.0,
          showText: true,
          scanArea: Size(700, 100));
    } on Exception {
      texts.add(OcrText('Failed to recognize text.'));
    }

    await images.dataUpdate('$dirPath/${no + 1}.jpg');
    textsOcr = texts;
    for (OcrText text in texts) {
      var exctract_cardnumber = '${text.value}'.replaceAll(RegExp(r"\D"), "");
      cardnumber = '${exctract_cardnumber}';
    }
  }
}
