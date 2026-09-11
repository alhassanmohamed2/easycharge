import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:easycharge/services/Ai_camera.dart';
import 'package:easycharge/services/card_charge.dart';
import 'package:easycharge/models/carrier_option.dart';
import 'package:path_provider/path_provider.dart';

class Options extends StatefulWidget {
  const Options({Key? key}) : super(key: key);

  @override
  State<Options> createState() => _OptionsState();
}

class _OptionsState extends State<Options> {
  final AiCamera _aiCam = AiCamera();
  final TextEditingController _cardNumField = TextEditingController();
  final FocusNode _myFocusNode = FocusNode();
  String? _selectedValue;
  bool _isProcessingCamera = false;

  @override
  void initState() {
    super.initState();
    _myFocusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _myFocusNode.dispose();
    _cardNumField.dispose();
    super.dispose();
  }

  void _showWebWarning(String feature) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$feature is not supported in the web browser. Please use an Android/iOS device.'),
        backgroundColor: Colors.red,
      )
    );
  }

  Future<void> _handleCharge(String newValue, CarrierOption option) async {
    if (kIsWeb) {
      _showWebWarning('USSD calling');
      return;
    }

    try {
      final extDir = await getApplicationDocumentsDirectory();
      final dirPath = extDir.path;
      
      setState(() {
        _selectedValue = newValue;
      });
      
      int index = option.items.indexOf(newValue);
      
      await chargeCard(
        _aiCam.cardnumber,
        _cardNumField.text,
        option.codes[index],
        dirPath,
        option.cardNumberLen,
        context
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}'))
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final CarrierOption option = ModalRoute.of(context)?.settings.arguments as CarrierOption;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          }
        ),
        title: Text(option.title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: option.primaryColor,
        elevation: 0,
      ),
      backgroundColor: Colors.grey[100],
      body: Container(
        padding: const EdgeInsets.only(top: 40, right: 16, left: 16),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(option.imagePath),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.darken),
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, 
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: option.primaryColor.withOpacity(0.5), width: 2)
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          focusNode: _myFocusNode,
                          controller: _cardNumField,
                          maxLength: option.cardNumberLen,
                          keyboardType: TextInputType.phone,
                          style: TextStyle(color: option.inputColor, fontSize: 20, letterSpacing: 2, fontWeight: FontWeight.bold),
                          decoration: InputDecoration(
                            labelText: "Card Code",
                            hintText: "Enter code or scan",
                            hintStyle: TextStyle(color: Colors.white54),
                            labelStyle: TextStyle(
                              fontSize: 16,
                              color: _myFocusNode.hasFocus ? Colors.white : option.labelColor,
                            ),
                            counterStyle: TextStyle(
                              color: option.hintColor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold
                            ),
                            filled: true,
                            fillColor: Colors.black45,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(color: option.primaryColor, width: 2)
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(color: Colors.white30, width: 1)
                            )
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      _isProcessingCamera 
                        ? const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: CircularProgressIndicator(color: Colors.white),
                          )
                        : Container(
                            margin: const EdgeInsets.only(bottom: 20),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: option.primaryColor,
                                padding: const EdgeInsets.all(16),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                                elevation: 8,
                              ),
                              onPressed: () async {
                                if (kIsWeb) {
                                  _showWebWarning('Camera OCR');
                                  return;
                                }
                                setState(() { _isProcessingCamera = true; });
                                try {
                                  await _aiCam.extractNumber();
                                  if (_aiCam.cardnumber.isNotEmpty) {
                                    _cardNumField.text = _aiCam.cardnumber;
                                  }
                                } catch (e) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('Camera error: ${e.toString()}'))
                                  );
                                } finally {
                                  setState(() { _isProcessingCamera = false; });
                                }
                              },
                              child: const Icon(Icons.camera_alt_rounded, color: Colors.white, size: 32),
                            ),
                          )
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(color: Colors.black26, blurRadius: 8, offset: const Offset(0, 4))
                      ]
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: _selectedValue,
                        isExpanded: true,
                        hint: Text(
                          "Select charging option",
                          style: TextStyle(
                            fontSize: 16,
                            color: option.primaryColor,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        icon: Icon(Icons.flash_on, color: option.primaryColor),
                        style: const TextStyle(color: Colors.black87, fontSize: 16, fontWeight: FontWeight.w600),
                        onChanged: (String? newValue) {
                          if (newValue != null) {
                            _handleCharge(newValue, option);
                          }
                        },
                        items: option.items.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ]
        )
      )
    );
  }
}
