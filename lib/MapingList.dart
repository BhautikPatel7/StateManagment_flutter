import 'package:flutter/material.dart';


class MapingIntoList extends StatelessWidget {

  var datalist = [
    {
      'name' : 'Raman',
      'mobno' : '985563542',
      'unread' : '2'
    },
     {
      'name' : 'Raman',
      'mobno' : '985563542',
      'unread' : '2'
    },
     {
      'name' : 'Raman',
      'mobno' : '985563542',
      'unread' : '2'
    },
     {
      'name' : 'Raman',
      'mobno' : '985563542',
      'unread' : '2'
    },
     {
      'name' : 'Raman',
      'mobno' : '985563542',
      'unread' : '2'
    },
     {
      'name' : 'Raman',
      'mobno' : '985563542',
      'unread' : '2'
    },
     {
      'name' : 'Raman',
      'mobno' : '985563542',
      'unread' : '2'
    },
     {
      'name' : 'Raman',
      'mobno' : '985563542',
      'unread' : '2'
    },


  ];
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(title: Text('Mapping Into List'),),
        body:Container(
          child: ListView(
            children: datalist.map((value) {
                return ListTile(
                  leading: Icon(Icons.account_circle),
                  title: Text(value['name'].toString()),
                  trailing: CircleAvatar(
                    radius: 11,
                    backgroundColor: Colors.red,
                    child: Text(value['unread'].toString(),style: TextStyle(fontSize: 15),)),
                );
            } ).toList(),
          ),
        ),
      );

  }


}