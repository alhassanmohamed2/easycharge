import 'package:flutter/material.dart';
import 'package:easycharge/services/Ai_camera.dart';
import 'package:easycharge/services/card_charge.dart';
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

  Future<void> _handleCharge(String newValue, Map compInfo, List compList) async {
    final extDir = await getApplicationDocumentsDirectory();
    final dirPath = extDir.path;
    
    setState(() {
      _selectedValue = newValue;
    });
    
    await chargeCard(
      _aiCam.cardnumber,
      _cardNumField.text,
      compInfo['Codes'][compList.indexOf(newValue)],
      dirPath,
      compInfo["cardNumberLen"],
      context
    );
  }

  @override
  Widget build(BuildContext context) {
    final Map compInfo = ModalRoute.of(context)?.settings.arguments as Map;
    final List<String> compList = List<String>.from(compInfo["Item"]);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          }
        ),
        title: Text(compInfo["title"], style: const TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: compInfo['color']['titlecol'],
      ),
      backgroundColor: Colors.grey[200],
      body: Container(
        padding: const EdgeInsets.only(top: 70, right: 10, left: 20),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(compInfo["image"]),
            fit: BoxFit.fill,
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, 
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(top: 25, right: 15, left: 5),
                    child: TextField(
                      focusNode: _myFocusNode,
                      controller: _cardNumField,
                      maxLength: compInfo["cardNumberLen"],
                      keyboardType: TextInputType.phone,
                      style: TextStyle(color: compInfo["color"]['input'], fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                        labelText: "اكتب كود الشحن او قم باستخراجه بالكاميرا",
                        labelStyle: TextStyle(
                          fontSize: 13,
                          color: _myFocusNode.hasFocus ? Colors.white : compInfo["color"]['label'],
                        ),
                        counterStyle: TextStyle(
                          color: compInfo["color"]['counter'],
                          fontSize: 15
                        ),
                        filled: true,
                        fillColor: Colors.black26,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide: BorderSide(
                            color: compInfo["color"]['border'],
                            width: 3
                          )
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide: BorderSide(
                            color: compInfo['color']['border'],
                            width: 2
                          )
                        )
                      ),
                    ),
                  )
                ),
                _isProcessingCamera 
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: compInfo['color']['titlecol'],
                        padding: const EdgeInsets.all(16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      ),
                      onPressed: () async {
                        setState(() { _isProcessingCamera = true; });
                        try {
                          await _aiCam.extractNumber();
                          _cardNumField.text = _aiCam.cardnumber;
                        } finally {
                          setState(() { _isProcessingCamera = false; });
                        }
                      },
                      child: const Icon(Icons.camera_alt_rounded, color: Colors.white, size: 28),
                    )
              ],
            ),
            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(12),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: _selectedValue,
                  hint: Text(
                    "بعد كتابه كود الشحن اختر طريقه الشحن من هنا",
                    style: TextStyle(
                      fontSize: 15,
                      color: compInfo["color"]['titlecol'],
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  icon: Icon(Icons.arrow_drop_down, color: compInfo['color']['titlecol']),
                  style: const TextStyle(color: Colors.black, fontSize: 16),
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      _handleCharge(newValue, compInfo, compList);
                    }
                  },
                  items: compList.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            )
          ]
        )
      )
    );
  }
}
