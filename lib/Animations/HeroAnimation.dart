import 'package:flutter/material.dart';


class HeroAnimationExample extends StatefulWidget {
  @override
  State<HeroAnimationExample> createState() => _HeroAnimationExample();
}

class _HeroAnimationExample extends State<HeroAnimationExample>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      Center(
        child: GestureDetector(
           onTap: () {
              Navigator.push(context, MaterialPageRoute(builder:(context) => DetailesPage(),));
            },
          child: Hero(
            tag: 'img',
            child: Image.asset('assets/images/Nature.com.png',height: 100, width: 100,)),
        ),

      ),
    );
  }
}

class DetailesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Hero(
          tag: 'img',
          child: Image.asset('assets/images/Nature.com.png')),
      ),
    );
  }
}