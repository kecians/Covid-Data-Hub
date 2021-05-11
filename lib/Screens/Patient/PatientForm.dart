import 'package:flutter/material.dart';
import 'package:patient_status_app/Components/MyTextField.dart';
import 'package:patient_status_app/Components/RoundButton.dart';
import 'package:patient_status_app/Utilities/constants.dart';
class PatientForm extends StatelessWidget {
  static final String id = 'PatientForm';
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Center(

        child: ListView(

          children:[
            Column(
              children: [
                SizedBox(height: 60,),
                Text('Health Check Form',style: TextStyle(color: Colors.blue[900],fontSize: 26,
                    fontWeight: FontWeight.w900,),),
                SizedBox(height: 60),
                MyTextField(text: 'Enter Patient\'s Name',width: 260,onPress: (value){}),
                SizedBox(height: 30),
                MyTextField(text: 'Enter ICMR ID',width: 260,onPress: (value){}),
                SizedBox(height: 30),
                MyTextField(text: 'Patient\'s SPO2 Level',width: 260,inputType: TextInputType.number,onPress: (value){}),
                SizedBox(height: 10),
                Text('Patients BloodPress',style: TextStyle(color: Colors.blueGrey),),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyTextField(text: 'Systolic',width: 120,inputType: TextInputType.number,onPress: (value){}),
                    SizedBox(width: 20,),
                    MyTextField(text: 'Diastolic',width: 120,inputType: TextInputType.number,onPress: (value){}),
                  ],
                ),
                SizedBox(height: 30,),
                MyTextField(text: 'Temperature in Fahrenheit',width: 260,inputType: TextInputType.number,onPress: (value){}),
                SizedBox(height: 60),
                RoundButton(color: Color(0XFFD5031A8D),text: "Submit", textColor: Colors.white,
                  onpress: (){ } ,height: 50,width: 260,),

              ],
            ),
          ],
        ),
      ),
    ));
  }
}
