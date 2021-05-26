import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
class TitleHead extends StatelessWidget {
  final double height;
  TitleHead({this.height});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: AnimatedTextKit(animatedTexts:  [
        TyperAnimatedText(
          'Welcome To',
          textStyle: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w900,
              color: Colors.white
          ),
          speed: Duration(milliseconds: 50),
        ),
        TyperAnimatedText(

          'Covid-19 Data Hub',
          textStyle: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w900,
              color: Colors.white
          ),
          speed: Duration(milliseconds: 50),
        ),
        TyperAnimatedText(

          'G T Govt Base Hospital Almora',
          textStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w900,
              color: Colors.white
          ),
          speed: Duration(milliseconds: 50),
        ),
      ],
        totalRepeatCount: 1,
      ),
      height: height,
      width: double.infinity,
      alignment: Alignment.bottomCenter,
      margin: EdgeInsets.only(left: 10,right: 10),
      decoration: BoxDecoration(
          color: Colors.lightBlue[900],
          borderRadius: BorderRadius.only(bottomRight:Radius.circular(20),
              bottomLeft:Radius.circular(20) )
      ),
      padding: EdgeInsets.only(bottom: 40),
    );
  }
}
