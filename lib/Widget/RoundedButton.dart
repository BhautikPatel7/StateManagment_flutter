import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String buttonName;
  final Icon? icon;
  final Color? color;
  final TextStyle? style;
  final VoidCallback? callback;

  RoundedButton(
      {required this.buttonName,
      this.icon,
      this.color = Colors.blueAccent,
      this.style,
      this.callback});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          callback!();
        },
        child: icon != null
            ? Row(
                children: [
                  Text(
                    buttonName,
                    style: style,
                  )
                ],
              )
            : Text(
                buttonName,
                style: style,
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: color,
                shadowColor: color,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  
                )
              ),
              
              );
  }
}
