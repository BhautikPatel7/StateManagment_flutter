import 'package:flutter/material.dart';
import 'package:widget_pratice/ui_helper/uiDesign.dart';

class StyleandTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Style and Theme'),
        actions: [Icon(Icons.add)],
      ),
      body: Column(
        children: [
          Text(
            'Hello Word',
            style: Theme.of(context)
                .textTheme
                .subtitle1!
                .copyWith(color: Colors.amber),
          ),
          Text(
            'Hello Word Two',
            style: myStyle35(TextColor: Color.fromARGB(255, 53, 85, 111),weight: FontWeight.bold),
          ),
          Text(
            'Hello Word',
            style: Theme.of(context).textTheme.headline1,
          ),
          Text(
            'Hello Word',
            style: TextStyle(
                fontSize: 29,
                fontWeight: FontWeight.normal,
                fontStyle: FontStyle.italic),
          ),
        ],
      ),
    );
  }
}
