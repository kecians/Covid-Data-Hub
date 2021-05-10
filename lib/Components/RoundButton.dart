import 'package:flutter/material.dart';
class RoundButton extends StatelessWidget {
  const RoundButton({this.color,this.onpress,this.text,this.height,this.width,this.textColor});
final Color color;
final Function onpress;
final String text;
final double height;
final double width;
final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 15.0,
      color: color,
      borderRadius: BorderRadius.circular(10.0),
      child: MaterialButton(
        onPressed: onpress,
        minWidth: width,
        height: height,
        child: Text(
            text , style: TextStyle(color: textColor),
        ),
      ),
    );
  }
}