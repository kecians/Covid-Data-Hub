import 'package:flutter/material.dart';
import 'package:patient_status_app/Screens/Home.dart';
import 'package:patient_status_app/Screens/Status.dart';

import 'Screens/Patient/PatientForm.dart';

void main() async{
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
        Status.id : (context){return Status();},
        PatientForm.id : (context){return PatientForm();}
      },
    );
  }
}
