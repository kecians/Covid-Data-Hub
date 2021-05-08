import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:patient_status_app/Components/RoundButton.dart';
import 'package:patient_status_app/Screens/DoctorLogin.dart';
import 'package:patient_status_app/Screens/PatientLogin.dart';
class Home extends StatefulWidget {
  static const String id = 'HomeScreen';
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:[
              AnimatedTextKit(animatedTexts:  [
                TypewriterAnimatedText(
                  'Patient Status App',
                  textStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  speed: Duration(milliseconds: 50),
                ),
              ],
               totalRepeatCount: 1,
              ),
            SizedBox(height: 60),
            RoundButton(color: Colors.amber[600],text: "Patient Login",
              onpress: (){Navigator.pushNamed(context, PatientLogin.id);},height: 50,width: 240,),
            SizedBox(height: 40,),
            RoundButton(color: Colors.lightGreenAccent[400],text: "Medical Staff Login",
              onpress: (){Navigator.pushNamed(context, DoctorLogin.id);},height: 50,width: 240,),
          ],
        ),
      ),
    );
  }
}


