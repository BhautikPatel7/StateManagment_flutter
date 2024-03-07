import 'package:flutter/material.dart';
class AnimationWscubeCon extends StatefulWidget {
  @override
  State<AnimationWscubeCon> createState() => _AnimationWscubeConState();
}

class _AnimationWscubeConState extends State<AnimationWscubeCon> {
  var  _width = 100.0;
bool flag = true;
  var _height = 100.0;

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Container Animation'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AnimatedContainer(duration: Duration(seconds: 5),
              width: _width,
              height: _height,
              color: Colors.blueGrey,
              ),
              ElevatedButton(onPressed: (){
              
                setState(() {
                      if (flag) {
                           _width = 300;
                     _height = 200;
                     flag = false;
                    }
                    else{
                      _width = 100;
                      _height = 100;
                      flag = true;
                    }  
                  }
                );
              }, child: Text('Start')),
            ],
          ),
        ),
      ),
    );


  }
}