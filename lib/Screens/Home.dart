import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:patient_status_app/Components/RoundButton.dart';
import 'package:patient_status_app/Utilities/constants.dart';
import 'package:patient_status_app/Components/TitleHead.dart';

import 'Nurses/NurseLogin.dart';
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
        resizeToAvoidBottomInset: false,
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
                  TitleHead(),
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
                        SizedBox(height: 100),
                        RoundButton(color: Color(0XFFD5031A8D),text: "Login", textColor: Colors.white,
                          onpress: (){ Navigator.pushNamed(context, NurseLogin.id); },height: 50,width: 260,),
                        SizedBox(height: 10,),
                        Text('Or',style: TextStyle(fontWeight: FontWeight.w900,fontSize: 16),),
                        SizedBox(height: 10,),
                        RoundButton(color: Color(0XFFD5031A8D),text: "Register", textColor: Colors.white,
                          onpress: (){ Navigator.pushNamed(context, NurseLogin.id); },height: 50,width: 260,),

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


