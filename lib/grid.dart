import 'package:flutter/material.dart';

class GridExample extends StatelessWidget{

  var arrcolor = [Colors.green,Colors.yellow,Colors.black,Colors.red,Colors.blue,Colors.pink,Colors.grey,Colors.orange];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              child: GridView.count(crossAxisCount: 4,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              children: [
                 Container( color: arrcolor[0]),
                 Container( color: arrcolor[1]),
                 Container( color: arrcolor[2]),
                 Container( color: arrcolor[3]),
                 Container( color: arrcolor[4]),
                 Container( color: arrcolor[5]),
                 Container( color: arrcolor[6]),
                 Container( color: arrcolor[7]),
              
              ],
              
              ),
            ),
        
            // Container(
            //   height: 100,
            // ),
        
            // Container(
            //   height: 100,
            //   child: GridView.extent(maxCrossAxisExtent: 100,
            //   crossAxisSpacing: 20,
            //   mainAxisSpacing: 20,
            //   children: [
            //      Container( color: arrcolor[0]),
            //      Container( color: arrcolor[1]),
            //      Container( color: arrcolor[2]),
            //      Container( color: arrcolor[3]),
            //      Container( color: arrcolor[4]),
            //      Container( color: arrcolor[5]),
            //      Container( color: arrcolor[6]),
            //      Container( color: arrcolor[7]),
            //   ],),
            // ),

            Container(
              height: 700,
              child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,mainAxisSpacing: 10,crossAxisSpacing: 10), itemBuilder: (context, index) {
                return Container(color: arrcolor[index]
                ,); 
              },itemCount: arrcolor.length),
              
            ),
          ],
        ),
      ),
    );
    
  }
}