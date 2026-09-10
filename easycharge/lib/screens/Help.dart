import 'package:easycharge/screens/AppBar.dart';
import 'package:easycharge/screens/drawer.dart';
import 'package:flutter/material.dart';
import 'package:easycharge/services/options_info.dart';
import 'package:easy_localization/easy_localization.dart';

class Help extends StatefulWidget {
  const Help({Key? key}) : super(key: key);

  @override
  State<Help> createState() => _HelpState();
}

class _HelpState extends State<Help> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Appbar(),
      endDrawer: const AppDrawer(screen: 'help'),
      body: Stepper(
        currentStep: _index,
        onStepCancel: () {
          if (_index > 0) {
            setState(() {
              _index -= 1;
            });
          }
        },
        onStepContinue: () {
          if (_index < steps.length - 1) {
            setState(() {
              _index += 1;
            });
          }
        },
        onStepTapped: (int index) {
          setState(() {
            _index = index;
          });
        },
        steps: _buildSteps(),
      ),
    );
  }

  List<Step> _buildSteps() {
    return List.generate(steps.length, (index) {
      return Step(
        title: Text(tr(steps[index])),
        content: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Image.asset('assets/help/${index + 1}.jpeg'),
        ),
      );
    });
  }
}
