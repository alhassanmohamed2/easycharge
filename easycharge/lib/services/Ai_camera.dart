import 'dart:async';
import 'dart:io';
import 'package:easycharge/services/database.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class AiCamera {
  String cardnumber = "";
  final ImageDatabase images = ImageDatabase();
  final TextRecognizer _textRecognizer = TextRecognizer();
  final ImagePicker _picker = ImagePicker();

  Future<void> extractNumber() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.camera);
      if (image == null) return;

      final inputImage = InputImage.fromFilePath(image.path);
      final RecognizedText recognizedText = await _textRecognizer.processImage(inputImage);
      
      String result = "";
      for (TextBlock block in recognizedText.blocks) {
        result += block.text;
      }
      
      // Extract only digits
      cardnumber = result.replaceAll(RegExp(r"\D"), "");
      
      // Get DB state to know what the next ID is
      await images.getDataBase();
      await images.openDataBase();
      await images.countImages();
      
      // Save image to documents directory so it can be loaded in Charged Cards page
      var extDir = await getApplicationDocumentsDirectory();
      var dirPath = extDir.path;
      String newPath = '$dirPath/${images.no_paths + 1}.jpg';
      
      // Copy the temporary camera image to the permanent storage location
      File(image.path).copySync(newPath);
      
    } catch (e) {
      cardnumber = "";
    }
  }
}
