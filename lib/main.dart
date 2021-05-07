import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        home: SafeArea(
          child: Scaffold(
             body: Center(
                child: TypewriterAnimatedTextKit( text: ["Patient Status App"],speed: Duration(milliseconds: 50)
                ,textStyle: TextStyle(fontSize: 30),),
             ),
          ),
        ),
    );
  }
}
