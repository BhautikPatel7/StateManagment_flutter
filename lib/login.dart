import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

double heightofiamge = 0;
double heightOfContainer = 0;
double height = 0;

Color colorforeachfield = Colors.black54;

TextStyle t1 = TextStyle(fontSize: 35, fontWeight: FontWeight.bold);
TextStyle t2 = TextStyle(
    fontSize: 20, fontWeight: FontWeight.normal, color: colorforeachfield);

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    heightofiamge = MediaQuery.of(context).size.height * 0.15;
    heightOfContainer = height - heightofiamge;
    return Scaffold(
      body: Column(
        children: [
          ImageAdjustMent(),
          Container(
            height: heightOfContainer,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                StaticTextOfLoginAndContinue(),
                ManageTextFieldsAndButton()
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ImageAdjustMent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double widthof = MediaQuery.of(context).size.width;
    print('The heigh if Image in Image Class is $heightofiamge');
    return Column(
      children: [
        Container(
          height: heightofiamge,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/abc.png'),
              alignment: Alignment.topRight,
            ),
          ),
        ),
      ],
    );
  }
}

class StaticTextOfLoginAndContinue extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Login',
                style: t1,
              )),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Plese sign in to continue',
                style: t2,
              )),
        ),
      ],
    );
  }
}

class ManageTextFieldsAndButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Email Field Validation
        Padding(
          padding: const EdgeInsets.only(left: 25, right: 25, top: 50),
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.email_outlined,
                size: height / 35,
                color: colorforeachfield,
              ),
              labelText: 'Email',
              labelStyle: TextStyle(color: colorforeachfield),
            ),
          ),
        ),

        // Password Validation
        Padding(
          padding: const EdgeInsets.only(left: 25, right: 25, top: 10),
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.lock_outlined,
                size: height / 35,
                color: colorforeachfield,
              ),
              labelText: 'Passcode',
              labelStyle: TextStyle(color: colorforeachfield),
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                child: SizedBox(
                  width: 120,
                  height: 120,
                  child: FittedBox(
                    child: Container(
                       decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0, 2.0), //(x,y)
              blurRadius: 6.0,
            ),
          ],
          gradient: LinearGradient(
            colors: [
              Colors.cyan,
              Colors.green,
            ],
          ),

        ),
                      child: FloatingActionButton.extended(
                        onPressed: () {
                          // Add your onPressed code here!
                        },
                        label: const Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                'Login',
                                style: TextStyle(fontSize: 20,color: Colors.white),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10,right: 20),
                              child: Icon(Icons.arrow_forward_rounded, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class BottomClickableline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(text: TextSpan(
      text: 'Don\'t have Account?'
    ),

      
       
    
    
    );
  }
  
}
