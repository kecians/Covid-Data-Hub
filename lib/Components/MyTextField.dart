import 'package:flutter/material.dart';
import 'package:patient_status_app/Utilities/constants.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    this.width,this.inputType,this.onPress,this.text
  });
  final double width;
  final TextInputType inputType;
  final Function onPress;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: TextField(
        keyboardType: inputType,
        style: TextStyle(color: Colors.black),
        onChanged: onPress,
        decoration: kInputDecorantion.copyWith(hintText: text),
      ),
    );
  }
}
