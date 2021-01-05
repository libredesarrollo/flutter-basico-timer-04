import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Color color;
  final String text;
  final Function onPressed;

  const MyButton({ @required this.color, @required this.text, @required this.onPressed}) : super();

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: this.color,
      textColor: Colors.white,
      child: Text(text),
    );
  }
}
