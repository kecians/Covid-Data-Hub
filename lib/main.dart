import 'package:flutter/material.dart';
import 'package:patient_status_app/Screens/Doctors/DoctorLogin.dart';
import 'package:patient_status_app/Screens/Home.dart';
import 'package:patient_status_app/Screens/Nurses/NurseLogin.dart';
import 'package:patient_status_app/Screens/Status.dart';

import 'Screens/Patient/PatientForm.dart';

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
        Status.id : (context){return Status();},
        PatientForm.id : (context){return PatientForm();}
      },
    );
  }
}


