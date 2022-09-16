import 'package:flutter/material.dart';

import '../screens/login_screen.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    Key? key,
    this.myText,
    this.mycolor,
    this.onpress,
  }) : super(key: key);

  final Color? mycolor;
  final String? myText;
  final onpress;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: mycolor,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onpress,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            '$myText',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
