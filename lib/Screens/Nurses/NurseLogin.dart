import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:patient_status_app/Components/Drawer.dart';
import 'package:patient_status_app/Components/PatientListCard.dart';
import 'package:patient_status_app/Components/RoundButton.dart';
import 'package:patient_status_app/Components/SearchBar.dart';
import 'package:patient_status_app/Model/Networking.dart';
import 'package:patient_status_app/Screens/Patient/PatientDetails.dart';
import 'package:patient_status_app/Screens/Patient/PatientForm.dart';
import 'package:patient_status_app/Utilities/constants.dart';

enum Bed{
   OxygenBed,
   NonOxyBed,
  VentilatorBed
}

class NurseLogin extends StatefulWidget {
  final data;
  NurseLogin({this.data});
  static const String id = 'NurseLogin';
  @override
  _NurseLoginState createState() => _NurseLoginState();
}

class _NurseLoginState extends State<NurseLogin> {
  Bed typeBed=Bed.NonOxyBed;
  String user,designation;
  String _token;
  void data(data){
    user = data[2];
    designation = "DEO";
    _token = data[3];
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data(widget.data);
    Networking().getPatientList(widget.data[3]);
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(child: MyDrawer(name: user,designation: designation)),
        appBar: AppBar(backgroundColor: Color(0XFFD5031A8D),shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(20),bottomLeft: Radius.circular(20))
        ),),
        body: Column(
          children: [
            SizedBox(height: 10,),
            SearchBar(),
            SizedBox(height: 10,),
            Container(child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Patient Name',style: kwhite),
                Text('Bed Number',style: kwhite),
                Text('Admitted On',style: kwhite)
              ],
            ),height: 50,width: double.infinity,
              color: Colors.blueGrey[900],
            ),
            SizedBox(height: 10,),
            Expanded(child: Padding(
              padding: const EdgeInsets.only(left: 10,right: 10),
              child: ListView(
                children: [
                  PatientListCard(patientName: 'Sunder Pichai',bedNo: 'B 21',admittedOn: "15 May 21",onPress: (){Navigator.push(context, MaterialPageRoute(builder:(context){return PatientDetails();}));}),
                  PatientListCard(patientName: 'Patient 1',bedNo: 'B 21',admittedOn: "15 May 21"),
                  PatientListCard(patientName: 'Patient 1',bedNo: 'B 21',admittedOn: "15 May 21"),
                  PatientListCard(patientName: 'Patient 1',bedNo: 'B 21',admittedOn: "15 May 21"),
                  PatientListCard(patientName: 'Patient 1',bedNo: 'B 21',admittedOn: "15 May 21"),
                  PatientListCard(patientName: 'Patient 1',bedNo: 'B 21',admittedOn: "15 May 21"),

                ],
              ),
            ),
            )
        ]
      ),
    )
    );
  }
}



