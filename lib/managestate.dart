import 'package:flutter/material.dart';

class Counterusingtwoclass extends StatelessWidget {
  final Function(int) onAddPressed;

  const Counterusingtwoclass({Key? key, required this.onAddPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FloatingActionButton(
          onPressed: () {
            // Call the callback function and pass the current counter value
            onAddPressed(1); // You can pass any value you want to the stateful widget
          },
          child: Text('Add'),
        )
      ],
    );
  }
}
class CounterStatefulclass extends StatefulWidget {
  @override
  State<CounterStatefulclass> createState() => _CounterStatefulclass();
}

class _CounterStatefulclass extends State<CounterStatefulclass>{
  int counter = 0;

  // Define a callback function to receive value from the stateless widget
  void _incrementCounter(int value) {
    setState(() {
      counter ++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('The Counter is $counter'),
            // Pass the callback function to the stateless widget
            Counterusingtwoclass(
              onAddPressed: _incrementCounter,
            ),
          ],
        ),
      ),
    );
  }
}