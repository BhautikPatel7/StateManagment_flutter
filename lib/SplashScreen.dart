import 'dart:async';

import 'package:flutter/material.dart';
import 'package:widget_pratice/CreatingCustomWidget.dart';
import 'package:widget_pratice/Parallxeffect.dart';

class SpashScrren extends StatefulWidget {
  @override
  State<SpashScrren> createState() => _SpashScrrenState();
}

class _SpashScrrenState extends State<SpashScrren> {

  @override
  void initState() {
    Timer(Duration(milliseconds: 11), () { 

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CustomWidgetUn()));
TextEditingController mycontroller = TextEditingController();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.blueAccent,
        child: Center(
            child: Text(
          'Loading...',
          style:
              TextStyle(fontFamily: 'Mukta', fontSize: 30, color: Colors.white),
        )),
      ),
    );
  }
}
