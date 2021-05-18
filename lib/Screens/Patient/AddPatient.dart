import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:patient_status_app/Components/MyTextField.dart';
import 'package:patient_status_app/Components/RoundButton.dart';
import 'package:patient_status_app/Model/Networking.dart';
import 'package:patient_status_app/Model/Toast.dart';
class AddPatient extends StatefulWidget {
  final token;
  AddPatient({this.token});
  @override
  _AddPatientState createState() => _AddPatientState();
}

class _AddPatientState extends State<AddPatient> {
  Networking instance = Networking();
  String dropdownValue1 = "Gender",
      dropdownValue2 = "Bed Type",
      dropdownValue3 = "Condition";
  String name,number,age,bedNo,address;
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: ProgressHUD(
      child: Builder(
        builder: (context)=>Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0XFFD5031A8D), shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20), bottomLeft: Radius.circular(20))
          ),),
          body: Center(

            child: ListView(

              children: [
                Column(
                  children: [
                    SizedBox(height: 30,),
                    Text('Patient Admission Form',
                      style: TextStyle(color: Colors.blue[900], fontSize: 26,
                        fontWeight: FontWeight.w900,),),
                    SizedBox(height: 30),
                    MyTextField(text: 'Enter Patient\'s Name',
                        width: 260,
                        onPress: (value) {name = value;}),
                    SizedBox(height: 20),
                    MyTextField(text: 'Patient\'s Phone Number',
                        width: 260,
                        inputType: TextInputType.number,
                        onPress: (value) {number = value;}),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DropDown1(),
                        SizedBox(width: 20,),

                        MyTextField(text: 'Age',
                            width: 120,
                            inputType: TextInputType.number,
                            onPress: (value) {age = value;}),
                      ],
                    ),
                    SizedBox(height: 20,),
                    MyTextField(text: 'Bed Number',
                        width: 260,
                        inputType: TextInputType.number,
                        onPress: (value) {bedNo=value;}),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DropDown2(),
                        SizedBox(width: 20,),
                        DropDown3()
                      ],
                    ),
                    SizedBox(height: 20,),
                    MyTextField(text: 'Address',
                        width: 260,
                        inputType: TextInputType.streetAddress,
                        onPress: (value) {address=value;}),
                    SizedBox(height: 30),
                    RoundButton(color: Color(0XFFD5031A8D),
                      text: "Submit",
                      textColor: Colors.white,
                      onpress: ()async {
                        final progress = ProgressHUD.of(context);
                        progress.show();
                        var res = await instance.AddPatient(widget.token, name, age,dropdownValue1,
                            dropdownValue2, bedNo,number, dropdownValue3, address);
                        if(res == 201)
                        { showToast(context, "Patient added Successfully");
                          Navigator.pop(context);
                        }
                        else
                        {
                          CoolAlert.show(
                            context: context,
                            type: CoolAlertType.error,
                            text: "Some field is empty or Bed already alloted!",
                          );
                        }
                        progress.dismiss();
                      },
                      height: 50,
                      width: 260,),
                  ],
                ),
              ],
            ),
          ),
        ),
      )
    ));
  }

  Container DropDown1() {
    return Container(width: 120,
      child: Center(
        child: DropdownButton<String>(
          underline: Container(height: 0,),
          value: dropdownValue1,
          icon: const Icon(Icons.arrow_drop_down_sharp),
          iconSize: 24,
          style: const TextStyle(color: Colors.blueGrey),
          onChanged: (String newValue) {
            setState(() {
              dropdownValue1 = newValue;
            });
          },
          items: <String>['Gender', 'M', 'F']
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

  Container DropDown3() {
    return Container(width: 120,padding: EdgeInsets.only(left: 3),
      child: Center(
        child: DropdownButton<String>(
          underline: Container(height: 0,),
          value: dropdownValue3,
          icon: const Icon(Icons.arrow_drop_down_sharp),
          iconSize: 24,
          style: const TextStyle(color: Colors.blueGrey),
          onChanged: (String newValue) {
            setState(() {
              dropdownValue3 = newValue;
            });
          },
          items: <String>[
            "Condition",
            "Asymptomatic",
            "Mild",
            "Moderate",
            "Severe"
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

  Container DropDown2() {
    return Container(width: 120,padding: EdgeInsets.only(left: 10),
      child: Center(
        child: DropdownButton<String>(
          underline: Container(height: 0,),
          value: dropdownValue2,
          icon: const Icon(Icons.arrow_drop_down_sharp),
          iconSize: 24,
          style: const TextStyle(color: Colors.blueGrey),
          onChanged: (String newValue) {
            setState(() {
              dropdownValue2 = newValue;
            });
          },
          items: <String>['Bed Type','General Bed','Oxygen Bed','ICU Bed','Ventilators']
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