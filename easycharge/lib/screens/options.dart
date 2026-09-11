import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:easycharge/services/Ai_camera.dart';
import 'package:easycharge/services/card_charge.dart';
import 'package:easycharge/models/carrier_option.dart';
import 'package:path_provider/path_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'dart:ui';

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
        content: Text('$feature is not supported in the web browser. Please use an Android device.'),
        backgroundColor: Colors.red.shade700,
        behavior: SnackBarBehavior.floating,
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
        SnackBar(
          content: Text('Error: ${e.toString()}'),
          backgroundColor: Colors.red.shade700,
          behavior: SnackBarBehavior.floating,
        )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final CarrierOption option = ModalRoute.of(context)?.settings.arguments as CarrierOption;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        title: Text(
          option.title, 
          style: const TextStyle(
            color: Colors.white, 
            fontWeight: FontWeight.w900,
            fontSize: 24,
            letterSpacing: 1.2,
          )
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Colors.black,
      body: Hero(
        tag: 'carrier_${option.title}',
        child: Material(
          type: MaterialType.transparency,
          child: Container(
            padding: const EdgeInsets.only(top: 80, right: 20, left: 20),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(option.imagePath),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5), 
                  BlendMode.darken
                ),
              )
            ),
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(32),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                  child: Container(
                    padding: const EdgeInsets.all(28),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(32),
                      border: Border.all(color: Colors.white.withOpacity(0.2), width: 1.5),
                      boxShadow: [
                        BoxShadow(
                          color: option.primaryColor.withOpacity(0.3),
                          blurRadius: 40,
                          spreadRadius: -10,
                        )
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: TextField(
                                focusNode: _myFocusNode,
                                controller: _cardNumField,
                                maxLength: option.cardNumberLen,
                                keyboardType: TextInputType.phone,
                                style: const TextStyle(
                                  color: Colors.white, 
                                  fontSize: 22, 
                                  letterSpacing: 4, 
                                  fontWeight: FontWeight.bold
                                ),
                                decoration: InputDecoration(
                                  labelText: tr('Card Code'),
                                  hintText: tr('Enter code or scan'),
                                  hintStyle: TextStyle(color: Colors.white.withOpacity(0.5), letterSpacing: 0),
                                  labelStyle: TextStyle(
                                    fontSize: 16,
                                    letterSpacing: 0,
                                    color: _myFocusNode.hasFocus ? Colors.white : Colors.white.withOpacity(0.7),
                                  ),
                                  counterStyle: TextStyle(
                                    color: Colors.white.withOpacity(0.7),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600
                                  ),
                                  filled: true,
                                  fillColor: Colors.black.withOpacity(0.3),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(color: option.primaryColor, width: 2)
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(color: Colors.white.withOpacity(0.3), width: 1)
                                  )
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            _isProcessingCamera 
                              ? Container(
                                  height: 60,
                                  width: 60,
                                  padding: const EdgeInsets.all(16.0),
                                  decoration: BoxDecoration(
                                    color: option.primaryColor,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: const CircularProgressIndicator(color: Colors.white, strokeWidth: 3),
                                )
                              : Container(
                                  margin: const EdgeInsets.only(bottom: 24),
                                  height: 60,
                                  width: 60,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: option.primaryColor,
                                      padding: EdgeInsets.zero,
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                      elevation: 8,
                                      shadowColor: option.primaryColor.withOpacity(0.5),
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
                                          SnackBar(
                                            content: Text('Camera error: ${e.toString()}'),
                                            behavior: SnackBarBehavior.floating,
                                          )
                                        );
                                      } finally {
                                        setState(() { _isProcessingCamera = false; });
                                      }
                                    },
                                    child: const Icon(Icons.document_scanner_rounded, color: Colors.white, size: 28),
                                  ),
                                )
                          ],
                        ),
                        const SizedBox(height: 24),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2), 
                                blurRadius: 15, 
                                offset: const Offset(0, 8)
                              )
                            ]
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: _selectedValue,
                              isExpanded: true,
                              hint: Text(
                                tr("Select charging option"),
                                style: TextStyle(
                                  fontSize: 16,
                                  color: option.primaryColor,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                              icon: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: option.primaryColor.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(12)
                                ),
                                child: Icon(Icons.flash_on_rounded, color: option.primaryColor, size: 20),
                              ),
                              style: const TextStyle(color: Colors.black87, fontSize: 16, fontWeight: FontWeight.w700),
                              onChanged: (String? newValue) {
                                if (newValue != null) {
                                  _handleCharge(newValue, option);
                                }
                              },
                              items: option.items.map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(tr(value)),
                                );
                              }).toList(),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ),
      )
    );
  }
}
