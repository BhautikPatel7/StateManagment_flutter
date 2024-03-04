import 'package:flutter/material.dart';
//import 'package:ui_demo3/main.dart';

class SignUpScreen extends StatefulWidget{
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
int  selectedInd = -1;
bool passwordhide = true;
bool passwordhide1 = true;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
       onTap: () {
        // When tapped outside the text field, reset selectedInd to -1
        setState(() {
          selectedInd = -1;
        });
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.15,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/abc.png'),
                  alignment: Alignment.topRight,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.1,
                right: MediaQuery.of(context).size.width * 0.1,
                top: MediaQuery.of(context).size.height * 0.05,
              ),
              child: ListView(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                  const Text(
                    'Create Account',
                    style: TextStyle(
                      fontFamily: 'Mukta',
                      fontWeight: FontWeight.w900,
                      fontSize: 35,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  
                  SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                  myW(Icons.person_2_outlined, 'FULL NAME', false, 0, true),
                  const SizedBox(height: 17),
                  myW(Icons.email_outlined, 'EMAIL', false, 1, true),
                  const SizedBox(height: 17),
                  myW(Icons.lock_outline, 'PASSWORD', false, 2, true),
                  const SizedBox(height: 17),
                  myW(Icons.lock_outline, 'CONFIRM PASSWORD', false, 3, false),
                   const SizedBox(height: 30),
            
                  Padding(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.5,
                      top: 10
                    ),
                    child: Container(
                      height:40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          colors: [
                            Colors.orange.shade200,
                            Colors.orange.shade600
                          ],
                        ),
                      ),
                      alignment: Alignment.center,
                      child: GestureDetector(
                        child:  const Text(
                          'SIGN UP  ➔',
                          style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),
                        ),
                           onTap: () {  
                           },
                      ),
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height*0.3,
                  top: MediaQuery.of(context).size.height*0.2,
                  left: MediaQuery.of(context).size.height*0.07
                    ),
                    child: RichText(text: TextSpan(
                      text:  "Already have an account?",
                      style: TextStyle(
                             fontFamily: 'Mukta',
                             fontSize: 14,
                             color: Colors.grey.shade500,
                            ),  
                      children: const <TextSpan>[
                            TextSpan(text: ' Sign in',
                         style: TextStyle(
                         color: Colors.orange,
                         fontFamily: 'Mukta',
                         fontSize: 14,
                    
                             ),
                           )
                         ]           
                      )
                    ),
                  )
                ],
              ),
            ),
            Padding(
             padding: EdgeInsets.only(
             left: MediaQuery.of(context).size.width * 0.05,
             top: MediaQuery.of(context).size.height * 0.05,
             ),
              child: GestureDetector(
                child: Icon(Icons.arrow_back,
                color: Colors.grey.shade500,
                size: 30,
                ),
                onTap: () {
                  print("object :: back");
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );

  }


   Widget myW(
      IconData anyIcon, String hint, bool isDone, int index, bool isNextFocus) {
    return Container(
      width: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.grey.shade200,width: 0.6),
        boxShadow: selectedInd == index 
            ? [
                BoxShadow(
                    blurRadius: 6,
                    spreadRadius: 0,
                    offset: Offset(6, 3),
                    color: Colors.grey.shade300),
              ]
            : null,
      ),
      child: TextField(
        textInputAction: isNextFocus ? TextInputAction.next : TextInputAction.done,
        decoration: InputDecoration(
          border: InputBorder.none,
      
      suffixIcon:  index==3 || index==2 ? InkWell(
        child: Icon(
                  index == 2
                      ? passwordhide == false ? Icons.visibility : Icons.visibility_off
                      : passwordhide1 == false ? Icons.visibility : Icons.visibility_off,
                  color: Colors.grey.shade500,
                ),
        onTap: () {
                  setState(() {
                    if (index == 2) {
                      passwordhide = !passwordhide;
                    } else if (index == 3) {
                      passwordhide1 = !passwordhide1;
                    }
                  });
                },
        ) : null,
      prefixIcon: Icon(anyIcon, color: Colors.grey.shade500),
      hintText: hint,
      hintStyle: TextStyle(
        fontFamily: 'Mukta',
        fontSize: 14,
        color: Colors.grey.shade500,
      ),
      // fillColor: Colors.grey.shade100,
      // filled: selectedInd == index ? true : false,
    ),
    onTap: () => setState(() {
      selectedInd = index;
    }),
    onSubmitted: (value) {
      setState(() {
        selectedInd = -1;
      });
    },
    style: const TextStyle(fontFamily: 'Mukta', fontWeight: FontWeight.bold),
     obscureText: index==2? passwordhide: index==3? passwordhide1: false,
    keyboardType: hint=='EMAIL'? TextInputType.emailAddress : TextInputType.visiblePassword,
  ),
    );
}

}