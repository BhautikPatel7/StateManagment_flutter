import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class ParsingFromOneScrrenToAnother extends StatefulWidget {
  ParsingFromOneScrrenToAnother({required this.name});
  final String name;

  @override
  State<ParsingFromOneScrrenToAnother> createState() =>
      _ParsingFromOneScrrenToAnotherState();
}

class _ParsingFromOneScrrenToAnotherState
    extends State<ParsingFromOneScrrenToAnother> {
  // SfRangeValues _values = SfRangeValues(40.0, 80.0);
  RangeValues values = RangeValues(0, 100);

  @override
  Widget build(BuildContext context) {
    RangeLabels labels =
        RangeLabels(values.start.toString(), values.end.toString());
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Parsing'),
        actions: [Icon(Icons.add)],
      ),
      body: Center(
          child: Column(
        children: [
          Text(
            'Welcome ${widget.name}',
            style: TextStyle(fontSize: 35),
          ),
          ElevatedButton(onPressed: null, child: Text('back')),
          //   SfRangeSlider(
          //      min: 0.0,
          // max: 100.0,
          // values: _values,
          // interval: 20,
          // showTicks: true,
          // showLabels: true,
          // shouldAlwaysShowTooltip: true,
          // showDividers: true,
          // minorTicksPerInterval: 1,
          // onChanged: (SfRangeValues values){
          //   setState(() {

          //   });(() {
          //     _values = values;
          //   });
          // },
          //   )
          // Range Slider

          RangeSlider(
            values: values,
            min: 0,
            max: 100,
            labels: labels,
            divisions: 10,
            activeColor: Colors.amber,
            inactiveColor: Colors.amberAccent[100],
            onChanged: (value) {
              setState(() {
                values = value;
                print('${value.start},${value.end}');
              });
            },
          )
        ],
      )),
    );
  }
}
