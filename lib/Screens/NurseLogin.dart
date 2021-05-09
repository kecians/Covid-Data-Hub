import 'package:flutter/material.dart';
import 'package:patient_status_app/Components/RoundButton.dart';
import 'package:patient_status_app/Screens/PatientType.dart';
import 'package:patient_status_app/Utilities/constants.dart';
class NurseLogin extends StatefulWidget {
  static const String id = 'NurseLogin';
  @override
  _NurseLoginState createState() => _NurseLoginState();
}

class _NurseLoginState extends State<NurseLogin> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Login as Nurse',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w900,
               color: Colors.lightBlue[900],),),
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
                RoundButton(color: Colors.lightBlue,text: 'Login',onpress: (){
                  // TODO : Change when you add Authentication
                  Navigator.pushNamed(context, PatientType.id);
                },height: 60, width: 260,)
              ],
            ),
          ),
      ),
    );
  }
}
