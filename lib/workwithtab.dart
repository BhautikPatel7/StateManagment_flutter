import 'package:flutter/material.dart';

class WorkWithTabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(length: 3, 
      
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home_outlined),),
              Tab(icon: Icon(Icons.home_outlined),),
              Tab(icon: Icon(Icons.home_outlined),),
            ],
          ),
        ),
        body: TabBarView(children: [
          Icon(Icons.access_alarm),
          Icon(Icons.access_alarm),
          Icon(Icons.access_alarm),
        ]),
      )),

    );
  }
}