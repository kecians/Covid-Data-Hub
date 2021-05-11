import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:patient_status_app/Components/Drawer.dart';
import 'package:patient_status_app/Components/PatientListCard.dart';
import 'package:patient_status_app/Components/RoundButton.dart';
import 'package:patient_status_app/Components/SearchBar.dart';
import 'package:patient_status_app/Screens/Patient/PatientForm.dart';

enum Bed{
   OxygenBed,
   NonOxyBed,
  VentilatorBed
}

class NurseLogin extends StatefulWidget {
  static const String id = 'NurseLogin';
  @override
  _NurseLoginState createState() => _NurseLoginState();
}

class _NurseLoginState extends State<NurseLogin> {
  Bed typeBed=Bed.NonOxyBed;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(child: MyDrawer(name: 'Shubham Tripathi',designation: 'Doctor   ; )',),),
        appBar: AppBar(backgroundColor: Color(0XFFD5031A8D),shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(20),bottomLeft: Radius.circular(20))
        ),),
        body: ListView(

          children: [
            SizedBox(height: 10,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RoundButton(text: "Normal Bed",onpress: (){
                  setState(() {
                    typeBed = Bed.NonOxyBed;
                  });
                },
                  color: typeBed == Bed.NonOxyBed ? Color(0XFFD5031A8D):Colors.white,
                  textColor: typeBed == Bed.NonOxyBed ? Colors.white:Colors.black,
                ),
                RoundButton(text: "Oxygen Bed",onpress: (){
                  setState(() {
                    typeBed = Bed.OxygenBed;
                  });
                },
                  textColor: typeBed == Bed.OxygenBed ? Colors.white:Colors.black,
                  color: typeBed == Bed.OxygenBed ? Color(0XFFD5031A8D):Colors.white,
                ),
                RoundButton(text: "Ventilator",width: 110,onpress: (){
                  setState(() {
                    typeBed = Bed.VentilatorBed;
                  });
                },color: typeBed == Bed.VentilatorBed ? Color(0XFFD5031A8D):Colors.white,
                  textColor: typeBed == Bed.VentilatorBed ? Colors.white:Colors.black,
                )
              ],
            ),
            SizedBox(height: 10,),
            SearchBar(),
            SizedBox(height: 10,),
            Column(
              children: [
                 PatientListCard(patientName: 'Patient 1',bedNo: 'B 21',onPress: (){Navigator.pushNamed(context, PatientForm.id);}),
                PatientListCard(patientName: 'Patient 1',bedNo: 'B 21',),
                PatientListCard(patientName: 'Patient 1',bedNo: 'B 21',),
                PatientListCard(patientName: 'Patient 1',bedNo: 'B 21',),
                PatientListCard(patientName: 'Patient 1',bedNo: 'B 21',),
                PatientListCard(patientName: 'Patient 1',bedNo: 'B 21',),

          ],
        ),
        ]
      ),
    )
    );
  }
}



