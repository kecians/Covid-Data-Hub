import 'dart:ui';

import 'package:flutter/material.dart';
class MyContainer extends StatelessWidget {
  const MyContainer({this.height,this.color1,this.color2,this.widget,this.onPress,this.paddingBottom,this.paddingTop});
  final Color color1,color2;
  final double height;
  final Widget widget;
  final Function onPress;
  final double paddingTop, paddingBottom;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        padding: EdgeInsets.only(top: paddingTop,bottom: paddingBottom),
        margin: EdgeInsets.only(left: 10,right: 10),
        alignment: Alignment.center,
        height: height,
        width: double.infinity,
        child: widget,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(colors: [
            color1,color2])
        ),

      ),
    );
  }
}
