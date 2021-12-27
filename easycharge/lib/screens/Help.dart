import 'package:easycharge/screens/AppBar.dart';
import 'package:easycharge/screens/drawer.dart';
import 'package:easycharge/services/options_info.dart';
import 'package:flutter/material.dart';

class Help extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(),
      endDrawer: drawer(),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return main_container_wid(steps, index);
        },
        itemCount: steps.length,
      ),
    );
  }
}

mysteps_func(var step_text, var step_num) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Text(
            " step $step_num:",
            style: TextStyle(
                color: Colors.blue,
                fontSize: 28.0,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                child: Text(
                  step_text,
                  style: TextStyle(color: Colors.black54, fontSize: 20.0),
                ),
              )
            ],
          ),
        ),
      )
    ],
  );
}

main_container_wid(var steps_list, var index) {
  return Padding(
    padding: const EdgeInsets.all(5.0),
    child: Container(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          // ignore: unnecessary_new
          child: new FittedBox(
            child: Material(
                color: Colors.white,
                elevation: 14.0,
                borderRadius: BorderRadius.circular(24.0),
                shadowColor: Color(0x802196F3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: mysteps_func(steps_list[index], index + 1),
                      ),
                    ),
                    // Container(
                    //   width: 200.0,
                    //   height: 180.0,
                    //   child: ClipRRect(
                    //       borderRadius: new BorderRadius.circular(24.0),
                    //       child: Image(
                    //         fit: BoxFit.contain,
                    //         alignment: Alignment.topRight,
                    //         image: AssetImage('assets/${index + 1}.jpg'),
                    //       )),
                    // ),
                  ],
                )),
          ),
        ),
      ),
    ),
  );
}
