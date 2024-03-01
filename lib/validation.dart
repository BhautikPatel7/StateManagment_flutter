import 'package:flutter/material.dart';


class Livevalidationonfield extends StatefulWidget {
  const Livevalidationonfield({super.key, required this.onSubmit});

    final ValueChanged<String> onSubmit;

  @override
  State<Livevalidationonfield> createState() => _LivevalidationonfieldState();
}

class _LivevalidationonfieldState extends State<Livevalidationonfield> {

  final mycontroller = TextEditingController();
  var _text = '';

  String? get _errorMassage{
    final text = mycontroller.text;
    if (text.isEmpty) {
      return 'can\'t be null';
    }
      if (text.length < 3) {
      return 'Too Short Name ';
    }
    return null;
  }

  void _submit(){
    if (_errorMassage == null) {
      widget.onSubmit(mycontroller.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: mycontroller,
                decoration: InputDecoration(
                  labelText: 'Enter a Name',
                  errorText: _errorMassage,
                ),
                 onChanged: (text) => setState(() => _text),
            ),
        
            ElevatedButton(onPressed: () {
              mycontroller.value.text.isNotEmpty ? _submit : null;
            },
            child: Text('Submit',),)
          ],
        ),
      )
    );
  }
}