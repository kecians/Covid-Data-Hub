import 'package:flutter/material.dart';
import 'package:patient_status_app/Screens/DoctorLogin.dart';
import 'package:patient_status_app/Screens/Home.dart';
import 'package:patient_status_app/Screens/PatientType.dart';
import 'package:patient_status_app/Screens/NurseLogin.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Home.id,
      routes: {
        Home.id : (context){return Home();},
        DoctorLogin.id  : (context){return DoctorLogin();},
        NurseLogin.id : (context){return NurseLogin();},
        PatientType.id : (context){return PatientType();},
      },
    );
  }
}


