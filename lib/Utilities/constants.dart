import 'package:flutter/material.dart';
const kInputDecorantion = InputDecoration(

  hintText: 'Enter text',
  hintStyle: TextStyle(color: Colors.grey),
  contentPadding:
  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide:
    BorderSide(color: Color(0XFFD5031A8D), width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide:
    BorderSide(color: Color(0XFFD5031A8D), width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

const kwhite = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.w700,
  fontSize: 12
);
const kdarkHeader = TextStyle(color: Colors.black,fontWeight: FontWeight.w900 ,fontSize: 16);
const kdarkValue = TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.w600,fontSize: 13);