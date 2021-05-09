import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:patient_status_app/Components/RoundButton.dart';
import 'package:patient_status_app/Utilities/constants.dart';
class Home extends StatefulWidget {
  static const String id = 'HomeScreen';
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Container(
          height: 30,
          color: Colors.black,
          child: Center(child: Text("@Copyright @2021 All rights reserved",
            style: TextStyle(color: Colors.white,fontSize: 12),),),
        ),
        body: Stack(
          children: [
            Container(
              alignment: Alignment.bottomLeft,
              child: SvgPicture.asset('assets/CovidAnimate.svg',height: 200,width: 200,),
            ),
            Center(
              child: ListView(

                children:[
                  Container(
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
                    ],
                      totalRepeatCount: 1,
                    ),
                    height: 200,
                    width: double.infinity,
                    alignment: Alignment.bottomCenter,
                    margin: EdgeInsets.only(left: 10,right: 10),
                    decoration: BoxDecoration(
                      color: Color(0XFFD5031A8D),
                      borderRadius: BorderRadius.only(bottomRight:Radius.circular(20),
                          bottomLeft:Radius.circular(20) )
                    ),
                    padding: EdgeInsets.only(bottom: 40),
                  ),

                  SizedBox(height: 100),
                  Column(
                      children: [

                        Container(
                          width: 260,
                          child: TextField(
                            style: TextStyle(color: Colors.black),
                            onChanged: (value){},
                            decoration: kInputDecorantion.copyWith(hintText: 'Enter your Username'),
                          ),
                        ),
                        SizedBox(height: 30),
                        Container(
                          width: 260,
                          child: TextField(
                            style: TextStyle(color: Colors.black),
                            onChanged: (value){},
                            decoration: kInputDecorantion.copyWith(hintText: 'Enter your password',),
                          ),
                        ),
                        SizedBox(height: 120),
                        RoundButton(color: Color(0XFFD5031A8D),text: "Login",
                          onpress: (){},height: 50,width: 260,),

                      ],
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

