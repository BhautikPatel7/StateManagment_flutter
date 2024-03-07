import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';

class AnimatedOpacityone extends StatefulWidget {
  @override
  State<AnimatedOpacityone> createState() => _AnimatedOpacityoneState();
}

class _AnimatedOpacityoneState extends State<AnimatedOpacityone> {
  var _opacity = 1.0;
  bool flag = true;
  bool isfirst =true;
  @override
  void initState() {
    Timer(Duration(seconds: 4), () { 
      MainFunctionOne();
    });
  }
  @override
    bool MainFunctionOne(){
      if (isfirst) {
        isfirst = false;
        return false;
      }
      return true;
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              opacity: _opacity,
              duration: Duration(seconds: 1),
              curve: Curves.elasticInOut,
              child: Container(
                width: 200,
                height: 200,
                color: Colors.amber,
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (flag) {
                      _opacity = 0.0;
                      flag = false;
                    } else {
                      _opacity = 1.0;
                      flag = true;
                    };
                  });
                },
                child: Text('Start')),

            // CrossFade Element
            AnimatedCrossFade(
                firstChild: Container(width: 200,height: 200,color: Colors.amber,),
                secondChild: Image.asset('assets/images/abc.png',width: 200,height: 200,),
                crossFadeState: isfirst ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                duration: Duration(seconds: 2))
          ],
        ),
      ),
    );
  }
}
