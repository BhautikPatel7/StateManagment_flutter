

import 'package:flutter/material.dart';

class BmiCalculator extends StatefulWidget {
  @override
  State<BmiCalculator> createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  var weighcontroller = TextEditingController();
  var feetcontroler = TextEditingController();
  var inchcontroller = TextEditingController();
 String x = '0';
 Color clr = Colors.green;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
      ),
      body: Container(
        color: clr,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'BMI',
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 21),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: weighcontroller,
                  decoration: InputDecoration(
                      label: Text('Enter Weight in kgs'),
                      prefixIcon: Icon(Icons.monitor_weight_outlined)),
                ),
                SizedBox(height: 11),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: feetcontroler,
                  decoration: InputDecoration(
                      label: Text('Enter Height in Feet'),
                      prefixIcon: Icon(Icons.height)),
                ),
                SizedBox(height: 11),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: inchcontroller,
                  decoration: InputDecoration(
                    label: Text('Enter Height in Inch'),
                    prefixIcon: Icon(Icons.height),
                  ),
                ),
                SizedBox(
                  height: 11,
                ),
                ElevatedButton(onPressed: () {
                  var j = weighcontroller.text.toString();
                  var k = feetcontroler.text.toString();
                  var l = inchcontroller.text.toString();
                  if (j != '' && k != '' && l != '') {
                     setState(() {
                    double a = double.parse(weighcontroller.text.toString()) ;
                    double b = double.parse(feetcontroler.text.toString()); 
                    double c = double.parse(inchcontroller.text.toString());
                    double d =  (b * 12) + c;
                    double e = d * 0.0254 ;
                    double f = (a/(e*e));
                    x = f.toString().substring(0,5);
                    print(x);
                    if (f <= 17) {
                      clr = Colors.redAccent;
                    }
                    if (f >= 26) {
                        clr = Colors.blueAccent;
                    }
                  });
                  }
                }, child: Text('Calculate')),
                SizedBox(height: 10,),
                Text('Your BMI is $x',style: TextStyle(fontSize: 20,color: Colors.black),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
