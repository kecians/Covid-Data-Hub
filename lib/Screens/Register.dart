import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:patient_status_app/Components/RoundButton.dart';
import 'package:patient_status_app/Components/TitleHead.dart';
import 'package:patient_status_app/Utilities/constants.dart';

import 'Nurses/NurseLogin.dart';
class Register extends StatefulWidget {
  static final String id = 'Register';

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String dropdownValue = 'Select';

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
                  SizedBox(height: 60),
                  Column(
                    children: [

                      Container(
                        width: 260,
                        child: TextField(
                          style: TextStyle(color: Colors.black),
                          onChanged: (value){},
                          decoration: kInputDecorantion.copyWith(hintText: 'Enter your UserID'),
                        ),
                      ),
                      SizedBox(height: 2,),
                      Text('This should be your unique staff ID',style: TextStyle(color: Colors.grey,fontSize: 12),),
                      SizedBox(height: 15),
                      Container(
                        width: 260,
                        child: TextField(
                          style: TextStyle(color: Colors.black),
                          onChanged: (value){},
                          decoration: kInputDecorantion.copyWith(hintText: 'Enter a password',),
                        ),
                      ),
                      SizedBox(height: 30,),
                      Container(
                        width: 260,
                        child: TextField(
                          style: TextStyle(color: Colors.black),
                          onChanged: (value){},
                          decoration: kInputDecorantion.copyWith(hintText: 'Confirm password',),
                        ),),
                      SizedBox(height: 30,),
                      DropDown(),
                      SizedBox(height: 30),
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

  Container DropDown() {
    return Container( width: 260,
                      child: Center(
                        child: DropdownButton<String>(
                          underline: Container(height: 0,),
                          value: dropdownValue,
                          icon: const Icon(Icons.arrow_drop_down_sharp),
                          iconSize: 24,
                          style: const TextStyle(color: Colors.blueGrey),
                          onChanged: (String newValue) {
                            setState(() {
                              dropdownValue = newValue;
                            });
                          },
                          items: <String>['Select','Nurse', 'Doctor',]
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                  decoration:  BoxDecoration(borderRadius: BorderRadius.circular(30),
                    color: Colors.white70,
                    border: Border.all(color: Colors.blue[900])
                  ),

                    );
  }
}
