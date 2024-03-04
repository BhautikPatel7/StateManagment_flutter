import 'package:flutter/material.dart';

class TextfieldsGetting extends StatelessWidget {
  var x = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    
    return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: x,
                onChanged: (value) {
                  String email = value;
                  print('This is Email That You Entred For Purpose is $email');
                },
              ),
              ElevatedButton(onPressed:() {
                String email = x.text.toString();
                print('djhbgfdjksgbjsbsdkj,gsf$email');

              }, child: Text('login')),

            ],
          ),
        ),
    );

  }
}