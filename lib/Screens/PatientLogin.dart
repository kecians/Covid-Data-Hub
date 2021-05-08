import 'package:flutter/material.dart';
import 'package:patient_status_app/Components/RoundButton.dart';
import 'package:patient_status_app/Screens/MedicationList.dart';
import 'package:patient_status_app/Utilities/constants.dart';
class PatientLogin extends StatefulWidget {
  static const String id = 'PatientLogin';
  @override
  _PatientLoginState createState() => _PatientLoginState();
}

class _PatientLoginState extends State<PatientLogin> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Login as a Patient',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w900,
               color: Colors.lightBlue[900],),),
              SizedBox(height: 80,),
                   Container(
                     width: 250,
                     child: TextField(
                       style: TextStyle(color: Colors.black),
                        onChanged: (value){},
                       decoration: kInputDecorantion.copyWith(hintText: 'Enter your ICMR number'),

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
                  Navigator.pushNamed(context, MedicationList.id);
                },height: 60, width: 260,)
              ],
            ),
          ),
      ),
    );
  }
}
