import 'package:flutter/material.dart';
import 'package:patient_status_app/Components/RoundButton.dart';
import 'package:patient_status_app/Utilities/constants.dart';
class DoctorLogin extends StatefulWidget {
  static const String id = 'DoctorLogin';
  @override
  _DoctorLoginState createState() => _DoctorLoginState();
}

class _DoctorLoginState extends State<DoctorLogin> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Login as Medical Staff',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w900,
                color: Colors.lightGreen[900],),),
              SizedBox(height: 80,),
              Container(
                width: 250,
                child: TextField(
                  style: TextStyle(color: Colors.black),
                  onChanged: (value){},
                  decoration: kInputDecorantion.copyWith(hintText: 'Enter your Employ Id'),

                ),
              ),
              SizedBox(height: 20,),
              Container(
                width: 250,
                child: TextField(
                  style: TextStyle(color: Colors.black),
                  onChanged: (value){},
                  decoration: kInputDecorantion.copyWith(hintText: 'Enter your mobile number'),

                ),
              ),
              SizedBox(height: 40,),
              RoundButton(color: Colors.lightGreen[700],text: 'Login',onpress: (){},height: 60, width: 260,)
            ],
          ),
        ),
      ),
    );
  }
}
