import 'package:flutter/material.dart';



class Tutorials5 extends StatelessWidget {
  const Tutorials5({super.key});
  callback(){
    print('call Back is Invoked');
  }

  @override
  Widget build(BuildContext context) {
    // Scaffold is a layout for
    // the major Material Components.
    return Scaffold(
      appBar: AppBar(
        leading: const IconButton(
          icon: Icon(Icons.menu),
          tooltip: 'Navigation menu',
          onPressed: null,
        ),
        title: const Text('Example title'),
        actions: const [
          IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          ),
        ],
      ),
      // body is the majority of the screen.
      body: ElevatedButton(
        onPressed: callback,
        child: Text('Click Me'))
    );
  }
}