import 'package:flutter/material.dart';
import 'package:patient_status_app/Components/MyTextField.dart';
import 'package:patient_status_app/Components/RoundButton.dart';
class AddPatient extends StatefulWidget {

  @override
  _AddPatientState createState() => _AddPatientState();
}

class _AddPatientState extends State<AddPatient> {
  String dropdownValue = "Gender";

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(backgroundColor: Color(0XFFD5031A8D),shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(20),bottomLeft: Radius.circular(20))
      ),),
      body: Center(

        child: ListView(

          children: [
            Column(
              children: [
                SizedBox(height: 50,),
                Text('Patient Admission Form',
                  style: TextStyle(color: Colors.blue[900], fontSize: 26,
                    fontWeight: FontWeight.w900,),),
                SizedBox(height: 50),
                MyTextField(text: 'Enter Patient\'s Name',
                    width: 260,
                    onPress: (value) {}),
                SizedBox(height: 30),
                MyTextField(text: 'Patient\'s Phone Number',
                    width: 260,
                    inputType: TextInputType.number,
                    onPress: (value) {}),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DropDown(),
                    SizedBox(width: 20,),
                    MyTextField(text: 'Age',
                        width: 120,
                        inputType: TextInputType.number,
                        onPress: (value) {}),
                  ],
                ),
                SizedBox(height: 30,),
                MyTextField(text: 'Address',
                    width: 260,
                    inputType: TextInputType.streetAddress,
                    onPress: (value) {}),
                SizedBox(height: 50),
                RoundButton(color: Color(0XFFD5031A8D),
                  text: "Submit",
                  textColor: Colors.white,
                  onpress: () {},
                  height: 50,
                  width: 260,),
              ],
            ),
          ],
        ),
      ),
    ));
  }

  Container DropDown() {
    return Container(width: 120,
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
          items: <String>[
            'Gender',
            'Female',
            'Male'
          ]
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),
          color: Colors.white70,
          border: Border.all(color: Colors.blue[900])
      ),

    );
  }
}
