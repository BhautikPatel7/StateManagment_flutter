import 'package:flutter/material.dart';



class Tutorials4 extends StatelessWidget {
  const Tutorials4({super.key});

  @override
  Widget build(BuildContext context) {
    var arrNames = ['san','df','dgs','dgfd','dgs','dfds','sdfsd'];
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
      body: 
          // ListView(
          //   scrollDirection: Axis.horizontal,
          //   children: [
          //     Text('one',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
          //     Text('Two',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
          //     Text('Three',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
          //     Text('Four',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
          //     Text('Five',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
          //   ],
          // ),

          ListView.builder(
            itemBuilder: (context, index) {
              return  Text(arrNames[index],style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w500),);
            },
            itemCount: arrNames.length,
          )
        
    );
  }
}