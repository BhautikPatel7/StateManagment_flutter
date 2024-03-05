

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:widget_pratice/ParsingFromOneScrrenToAnother.dart';
import 'package:widget_pratice/Widget/RoundedButton.dart';
import 'package:widget_pratice/main.dart';
import 'package:widget_pratice/ui_helper/uiDesign.dart';

class CustomWidgetUn extends StatelessWidget{
  TextEditingController mycontoller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Creating Custom Widget'),),
      body:  Column(
        children: [
          Center(
            child: Container(
              width: 140,
              child: RoundedButton(buttonName: 'Login',
              icon: Icon(Icons.delete),
              callback: () {
                Navigator.push(context, 
                MaterialPageRoute(builder: (context) => ParsingFromOneScrrenToAnother(name: mycontoller.text.toString(),)));
                
              },
              style: myStyle35(),
              ),
            ),
          ),
          // Center(
          //   child: Container(
          //     width: 140,
          //     child: RoundedButton(buttonName: 'Login',
          //     icon: Icon(Icons.delete),
          //     callback: () {
          //       print('sfhsuedafnisaudhgsjaiudhgujisdhfguedshfguasdjighsiudkfhgsfdgjksfdhgiufdsughusfidhgeurgjih');
                
          //     },
          //     style: myStyle35(),
          //     ),
          //   ),
          // ),

          TextField(
            controller: mycontoller,
          )
        ],
      ),
    );
    
  }
}