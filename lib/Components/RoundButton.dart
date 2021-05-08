import 'package:flutter/material.dart';
class RoundButton extends StatelessWidget {
  const RoundButton({this.color,this.onpress,this.text});
final Color color;
final Function onpress;
final String text;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5.0,
      color: color,
      borderRadius: BorderRadius.circular(30.0),
      child: MaterialButton(
        onPressed: onpress,
        minWidth: 240.0,
        height: 50.0,
        child: Text(
            text
        ),
      ),
    );
  }
}