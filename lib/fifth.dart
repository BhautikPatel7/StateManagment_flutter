import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// class Tutorials5 extends StatelessWidget {
//   const Tutorials5({super.key});
//   callback() {
//     print('call Back is Invoked');
//   }

//   @override
//   Widget build(BuildContext context) {
//     // Scaffold is a layout for
//     // the major Material Components.
//     return Scaffold(
//         appBar: AppBar(
//           leading: const IconButton(
//             icon: Icon(Icons.menu),
//             tooltip: 'Navigation menu',
//             onPressed: null,
//           ),
//           title: const Text('Example title'),
//           actions: const [
//             IconButton(
//               icon: Icon(Icons.search),
//               tooltip: 'Search',
//               onPressed: null,
//             ),
//           ],
//         ),
//         // body is the majority of the screen.
//         body: ElevatedButton(onPressed: callback, child: Text('Click Me')));
//   }
// }

// class Counter extends StatefulWidget {
//   final int id;
//   const Counter(this.id,{super.key});

//   @override
//   State<Counter> createState() => _CounterState();
// }

// class _CounterState extends State<Counter> {
//   int counter  = 0;
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build

//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 90),
//       child: Column(
//         children: [
//           Text('The Given Id is ${widget.id}'),
//           Text('$counter'),
//           ElevatedButton(onPressed: () => setState(() {
//             print('The Value Is $counter');
//             counter++;
//           }),
//           child: Text('Clcik ME'),)
//         ],
//       ),
//     );
//   }
// }

// class StateManager extends StatefulWidget{
//   StateManager({super.key});
//   @override
//   State<StateManager> createState() => _StateManagerState();
// }

// class _StateManagerState extends State<StateManager>{
//  int count = 999;
//  void incriment(){
//   setState(() {
//     count++;
//   });
//  }
//  void decriment(){
//  setState(() {
//    count--;
//  });
//  }

//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Scaffold(
//        appBar: AppBar(
//           leading: const IconButton(
//             icon: Icon(Icons.menu),
//             tooltip: 'Navigation menu',
//             onPressed: null,
//           ),
//           title: const Text('Example title'),
//           actions: const [
//             IconButton(
//               icon: Icon(Icons.search),
//               tooltip: 'Search',
//               onPressed: null,
//             ),
//           ],
//         ),

//         body: Center(
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               FloatingActionButton(onPressed: incriment,
//               child: Text('+1',style: TextStyle(fontSize: 23,color: Colors.green),),),
//               Padding(
//                 padding: const EdgeInsets.all(20),
//                 child: Text('$count',style: TextStyle(fontSize: 40),),
//               ),
//               FloatingActionButton(onPressed: decriment,
//               child: Text('-1',style: TextStyle(fontSize: 23,color: Colors.red),),),
//             ],
//           ),
//         ),
//     );
//   }
//   }

// Passing The State With Provider

class ProviderState with ChangeNotifier {
  int count = 0;
  void incriment() {
    count++;
    notifyListeners();
  }

  void decriment() {
    count--;
    notifyListeners();
  }

  int get _currentcount => count;
}

class myAppone extends StatelessWidget {
  const myAppone();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProviderState(),
      child: const UIpage(),
    );
  }
}

class UIpage extends StatelessWidget {
  const UIpage();

  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<ProviderState>(context);
    return Scaffold(
        body: Center(
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      FloatingActionButton(
        onPressed: () => counter.incriment(),
        child: const Text(
          '+1',
          style: TextStyle(fontSize: 23, color: Colors.green),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(20),
        child: Text(
          '${counter._currentcount}',
          style: const TextStyle(fontSize: 40),
        ),
      ),
      FloatingActionButton(
        onPressed: () => counter.decriment(),
        child: const Text(
          '-1',
          style: TextStyle(fontSize: 23, color: Colors.red),
        ),
      ),
    ])));
  }
}
