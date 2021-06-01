import 'package:flutter/material.dart';
import 'package:patient_status_app/MainHome.dart';
import 'package:patient_status_app/Model/LoadingScreenHome.dart';
import 'package:patient_status_app/Screens/Home.dart';
import 'package:patient_status_app/Screens/Status.dart';

import 'Screens/Patient/PatientForm.dart';

void main() async{runApp(Main());}
class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: LoadingScreenHome.id,
      routes: {
        LoadingScreenHome.id : (context){return LoadingScreenHome();},
        MainHome.id : (context){return MainHome();},
        Home.id : (context){return Home();},
        Status.id : (context){return Status();},
        PatientForm.id : (context){return PatientForm();}
      },
    );
  }
}
