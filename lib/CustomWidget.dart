import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomWidget extends StatelessWidget {
  const CustomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Customwidgetone(),
          CustomwidgetTwo(),
          CustomwidgetThree(),
          UseofStack()
        ],
      ),
    );
  }
}

class Customwidgetone extends StatelessWidget {
  const Customwidgetone({super.key});

  @override
  Widget build(BuildContext context) {
    return  Expanded(
            flex: 1,
            child: Container(
              color: Colors.amber,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Container(
                    height: 100,
                    width: 100,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.green),
                  );
                },
                scrollDirection: Axis.horizontal,
              ),
            ),
          );
  }
  
}
class CustomwidgetTwo extends StatelessWidget {
  const CustomwidgetTwo({super.key});

  @override
  Widget build(BuildContext context) {
return    Expanded(
            flex: 2,
            child: Container(
              color: Color.fromARGB(255, 172, 163, 218),
              child: ListView.builder(
                itemCount:50,
                itemBuilder: (context, index) {
                  return const ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 186, 177, 200),
                      child: Text("Circle"),
                    ),
                    title: Text('Item'),
                    subtitle: Text('Item description'),
                    trailing: Icon(Icons.more_vert),
                  );
                },
              ),
            ),
          );

  }
  
}
class CustomwidgetThree extends StatelessWidget {
  const CustomwidgetThree({super.key});

  @override
  Widget build(BuildContext context) {
    return  Expanded(
            flex: 1,
            child: Container(
              color: Color.fromARGB(255, 46, 197, 96),
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text('Hello'),
                  );
                },
              ),
            ),
          );
  }
  
}

class UseofStack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return Expanded(
     child: Container(
      width: 300,
      height: 300,
       child: Stack(
         children:[
          Container(
           height: 200,
           width: 200,
           color: Colors.blueGrey,
         ),
         Positioned(
          left: 85,
          top: 21,
           child: Container(
            height: 150,
            width: 150,
            color: Colors.amber,
           ),
         ),
          Positioned(
          left: 160,
          top: 100,
           child: Container(
            height: 100,
            width: 100,
            color: Colors.green,
           ),
         )
         ] 
       ),
     ),
   );
  }
}

