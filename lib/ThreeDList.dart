import 'package:flutter/material.dart';

class ThreeDList extends StatelessWidget {
  List<int> numberlist = [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    17,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ListWheelScrollView(itemExtent: 100,
         children: numberlist.map((value) =>  Container(
            width: double.infinity,
            decoration: BoxDecoration(
                 color: Color.fromARGB(255, 232, 215, 153),
                 borderRadius: BorderRadius.circular(20)
            ),
            child: Center(child: Text('${numberlist[value]}')),
          ),).toList(),
         
         
         ));
  }
}
