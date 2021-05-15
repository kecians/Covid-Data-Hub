import 'package:flutter/material.dart';
import 'package:patient_status_app/Components/MyTextField.dart';
import 'package:patient_status_app/Components/RoundButton.dart';
class PatientForm extends StatefulWidget {
  static final String id = 'PatientForm';
  final String patientName;
  final String patient_id;
  PatientForm({this.patientName,this.patient_id});

  @override
  _PatientFormState createState() => _PatientFormState();
}

class _PatientFormState extends State<PatientForm> {
  String patient,patid;
  String dropdownValue = 'Select';

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Center(

        child: ListView(

          children:[
            Column(
              children: [
                SizedBox(height: 50,),
                Text('Health Check Form',style: TextStyle(color: Colors.blue[900],fontSize: 26,
                    fontWeight: FontWeight.w900,),),
                SizedBox(height: 50),
                MyTextField(text: 'Enter Patient\'s Name',width: 260,onPress: (value){patient = widget.patientName;}),
                SizedBox(height: 30),
                MyTextField(text: 'Enter Patient ID',width: 260,onPress: (value){patid = widget.patient_id;}),
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
                DropDown(),
                SizedBox(height: 30,),
                MyTextField(text: 'Temperature in Fahrenheit',width: 260,inputType: TextInputType.number,onPress: (value){}),
                SizedBox(height: 50),
                RoundButton(color: Color(0XFFD5031A8D),text: "Submit", textColor: Colors.white,
                  onpress: (){ } ,height: 50,width: 260,),
              ],
            ),
          ],
        ),
      ),
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

