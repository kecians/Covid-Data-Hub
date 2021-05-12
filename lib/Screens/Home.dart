
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:patient_status_app/Components/RoundButton.dart';
import 'package:patient_status_app/Networking/Networking.dart';
import 'package:patient_status_app/Screens/Nurses/NurseLogin.dart';
import 'package:patient_status_app/Screens/Register.dart';
import 'package:patient_status_app/Utilities/constants.dart';
import 'package:patient_status_app/Components/TitleHead.dart';
class Home extends StatefulWidget {
  static const String id = 'HomeScreen';
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Networking instance = Networking();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  String errortext ="";
  bool isLogin = false;
  @override
  void initState() {
    super.initState();

  }
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
                  SizedBox(height: 80),
                  Column(
                      children: [
                        Text(errortext,style: TextStyle(color: Colors.red),),
                        SizedBox(height: 10,),
                        Container(
                          width: 260,
                          child: TextField(

                            controller: _usernameController,

                            style: TextStyle(color: Colors.black),
                            decoration: kInputDecorantion.copyWith(hintText: "Enter Your Username"),
                          ),
                        ),
                        SizedBox(height: 30),
                        Container(
                          width: 260,
                          child: TextField(
                            controller: _passwordController,
                            style: TextStyle(color: Colors.black),
                            decoration: kInputDecorantion.copyWith(hintText: 'Enter your password',),
                          ),
                        ),
                        SizedBox(height: 100),
                        RoundButton(color: Color(0XFFD5031A8D),text: "Login", textColor: Colors.white,
                          onpress: ()async{
                            var statuscode = await instance.signin(_usernameController.text, _passwordController.text);

                            if(statuscode == 200)
                              {
                                 Navigator.pushNamedAndRemoveUntil(context, NurseLogin.id, (route) => false);

                              }
                             else
                               {
                                 if(_usernameController.text.length <=4 || _passwordController.text.length<3)
                                   {
                                     errortext = "Entery too short";
                                   }
                                 else{
                                   errortext = "Invalid User";
                                 }
                                 setState(() {
                                   errortext;
                                   _usernameController.text = "";
                                   _passwordController.text ="";
                                 });
                               }
                            }
                          ,height: 50,width: 260,),
                        SizedBox(height: 10,),
                        Text('Or',style: TextStyle(fontWeight: FontWeight.w900,fontSize: 16),),
                        SizedBox(height: 10,),
                        RoundButton(color: Color(0XFFD5031A8D),text: "Register", textColor: Colors.white,
                          onpress: (){ Navigator.pushNamed(context, Register.id); },height: 50,width: 260,),

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


