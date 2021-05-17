import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:patient_status_app/Components/MyTextField.dart';
import 'package:patient_status_app/Components/RoundButton.dart';
import 'package:patient_status_app/Model/Networking.dart';
import 'package:patient_status_app/Screens/NurseLogin.dart';
class PatientForm extends StatefulWidget {
  static final String id = 'PatientForm';
  final String patientName;
  final String patient_id;
  final String token;
  PatientForm({this.patientName,this.patient_id,this.token});

  @override
  _PatientFormState createState() => _PatientFormState();
}

class _PatientFormState extends State<PatientForm> {
  Networking instance = Networking();
  String temp;
  String spo2,sys,dia,pulse;
  String dropdownValue = 'Select';
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: ProgressHUD(
        child: Builder(
          builder: (context)=>Center(

            child: ListView(

              children:[
                Column(
                  children: [
                    SizedBox(height: 40,),
                    Text('Health Check Form',style: TextStyle(color: Colors.blue[900],fontSize: 26,
                      fontWeight: FontWeight.w900,),),
                    SizedBox(height: 40),
                    Container(
                      child: Center(child: Text('${widget.patientName}',style: TextStyle(fontSize: 18))),
                      width: 260,height: 50,
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0XFFD5031A8D)),
                          borderRadius: BorderRadius.circular(32)
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      child: Center(child: Text('${widget.patient_id}',style: TextStyle(fontSize: 18))),
                      width: 260,height: 50,
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0XFFD5031A8D)),
                          borderRadius: BorderRadius.circular(32)
                      ),
                    ),
                    SizedBox(height: 20),
                    MyTextField(text: 'Patient\'s SPO2 Level',width: 260,inputType: TextInputType.number,onPress: (value){spo2 = value;}),
                    SizedBox(height: 5),
                    Text('Patients BloodPress',style: TextStyle(color: Colors.blueGrey),),
                    SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyTextField(text: 'Systolic',width: 120,inputType: TextInputType.number,onPress: (value){sys =value;}),
                        SizedBox(width: 20,),
                        MyTextField(text: 'Diastolic',width: 120,inputType: TextInputType.number,onPress: (value){dia = value;}),
                      ],
                    ),
                    SizedBox(height: 20,),
                    MyTextField(text: 'Pulse Rate',width: 260,inputType: TextInputType.number,onPress: (value){pulse = value;}),
                    SizedBox(height: 20,),
                    DropDown(),
                    SizedBox(height: 20,),
                    MyTextField(text: 'Temperature in Fahrenheit',width: 260,inputType: TextInputType.number,onPress: (value){temp = value;}),
                    SizedBox(height: 40),
                    RoundButton(color: Color(0XFFD5031A8D),text: "Submit", textColor: Colors.white,
                      onpress: ()async{
                        final progress = ProgressHUD.of(context);
                        progress.show();
                        var res = await instance.HealthUpdate(widget.token,widget.patient_id, sys, dia, pulse, temp, spo2, dropdownValue);
                        if(res == 201)
                        {
                          Navigator.popUntil(context, (route) => false);
                        }
                        else
                        {
                          CoolAlert.show(
                            context: context,
                            type: CoolAlertType.success,
                            text: "Some field is empty or improperly filled!",
                          );
                        }
                        progress.dismiss();
                      } ,height: 50,width: 260,),
                  ],
                ),
              ],
            ),
          ),
        ),
      )
    ));
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
          items: <String>['Select','Asymptomatic', 'Mild','Moderate','Severe']
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

