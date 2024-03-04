import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SimpleCalc extends StatefulWidget {
  
  @override
  State<SimpleCalc> createState(){
    return _Simplecalc();
  }
}

class _Simplecalc extends State<SimpleCalc>{
  TextEditingController controller1  = TextEditingController();
   TextEditingController controller2 = TextEditingController();
   var Result = '';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            keyboardType: TextInputType.number,
            controller: controller1,
          ),
          TextField(
             keyboardType: TextInputType.number,
            controller: controller2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(onPressed: (){
                var no1 = int.parse( controller1.text.toString());
                var no2 = int.parse( controller2.text.toString());
               var  sum = no1 + no2;
               setState(() {
                   Result = "$sum" ;
               });
              //  print(Result);
              }, child: Text('Add')),
              ElevatedButton(onPressed: (){
                  var no1 = int.parse( controller1.text.toString());
                var no2 = int.parse( controller2.text.toString());
               var  sum = no1 - no2;
               setState(() {
                   Result = "$sum" ;
               });
              }, child: Text('Remove')),
              ElevatedButton(onPressed: (){
                  var no1 = int.parse( controller1.text.toString());
                var no2 = int.parse( controller2.text.toString());
               var  sum = no1 * no2;
               setState(() {
                   Result = "$sum" ;
               });
              }, child: Text('Multiply')),
              ElevatedButton(onPressed: (){
                  var no1 = int.parse( controller1.text.toString());
                var no2 = int.parse( controller2.text.toString());
               var  sum = no1 / no2;
               setState(() {
                   Result = "$sum" ;
               });
              }, child: Text('Divide')),
            ],
          ),  
          Text('$Result'),
        ],
      ),
    );
  }
}