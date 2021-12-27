import 'package:easycharge/screens/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobile_vision_2/flutter_mobile_vision_2.dart';
import 'package:easycharge/services/Ai_camera.dart';
import 'package:easycharge/services/card_charge.dart';

class Options extends StatefulWidget {
  @override
  State<Options> createState() => _OptionsState();
}

class _OptionsState extends State<Options> {
  Ai_cam ai_cam = Ai_cam();
  final card_num_field = TextEditingController();

  @override
  void initState() {
    super.initState();
    ai_cam.initPlatformState();
    FlutterMobileVision.start().then((previewSizes) => setState(() {
          ai_cam.previewOcr = previewSizes[ai_cam.cameraOcr]!.first;
        }));
  }

  @override
  Widget build(BuildContext context) {
    // ignore: dead_code, dead_code
    final Map comp_info = ModalRoute.of(context)?.settings.arguments as Map;
    String? value = comp_info["Item"][0];
    var comp_list = comp_info["Item"];

    return Scaffold(
        appBar: AppBar(
          title: Text(comp_info["title"]),
          centerTitle: true,
          backgroundColor: Colors.purpleAccent,
        ),
        endDrawer: drawer(),
        body: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage(comp_info["image"]),
              fit: BoxFit.fill,
            )),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                      child: Container(
                    padding: const EdgeInsets.only(top: 30, right: 10),
                    child: TextField(
                      controller: card_num_field,
                      maxLength: 14,
                      keyboardType: TextInputType.phone,
                      style: const TextStyle(color: Colors.purple),
                      decoration: InputDecoration(
                          fillColor: Colors.purple[40],
                          filled: true,
                          enabled: true,
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 3)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 3))),
                    ),
                    width: 200,
                  )),
                  MaterialButton(
                    onPressed: () async {
                      String? card_num = await ai_cam.ExtractNumber();
                      setState(() {
                        card_num_field.text = ai_cam.cardnumber;
                      });
                    },
                    child: const Icon(Icons.camera_alt_rounded),
                    color: Colors.purple,
                    minWidth: 50,
                    height: 50,
                    padding: const EdgeInsets.only(bottom: 10, top: 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  )
                ],
              ),
              DropdownButton<String>(
                value: value,
                icon: const Icon(Icons.arrow_downward),
                elevation: 16,
                style: const TextStyle(color: Colors.deepPurple),
                underline: Container(
                  height: 2,
                  color: Colors.deepPurpleAccent,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    value = newValue!;
                    ChargeCard(card_num_field.text,
                        comp_info['Codes'][comp_list.indexOf(newValue)]);
                  });
                },
                items: comp_list.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              )
            ])));
  }
}
