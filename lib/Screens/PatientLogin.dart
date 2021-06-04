import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:flutter_svg/svg.dart';
import 'package:patient_status_app/Components/RoundButton.dart';
import 'package:patient_status_app/Components/TitleHead.dart';
import 'package:patient_status_app/Model/Networking.dart';
import 'package:patient_status_app/Screens/Patient/LastFive.dart';
import 'package:patient_status_app/Screens/Patient/PatientInfo.dart';
import 'package:patient_status_app/Utilities/constants.dart';
class PatientLogin extends StatefulWidget {
  @override
  _PatientLoginState createState() => _PatientLoginState();
}

class _PatientLoginState extends State<PatientLogin> {
  Networking instance = Networking();
  String errortext="";
  TextEditingController userController = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          bottomNavigationBar: Container(
            height: 30,
            color: Colors.black,
            child: Center(child: Text("Developed by Ayush Bisht | Prashant Pandey | Shubham Tripathi BTKIT Dwarahat",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white,fontSize: 12,),),),
          ),
          body: ProgressHUD(
            child: Builder(
              builder: (context)=> Stack(
                children: [
                  Container(
                    alignment: Alignment.bottomLeft,
                    child: SvgPicture.asset('assets/CovidAnimate.svg',height: 200,width: 200,),

                  ),
                  Center(

                    child: ListView(

                      children:[
                        TitleHead(height: 120),
                        SizedBox(height: 40,),
                        Center(
                          child: Text('Patient Login',style: TextStyle(color: Colors.lightBlue[900],fontSize: 26,
                            fontWeight: FontWeight.w900,),),
                        ),
                        SizedBox(height: 40),
                        Column(
                          children: [
                            Container(
                              width: 260,
                              child: TextField(

                                controller: userController,

                                style: TextStyle(color: Colors.black),
                                decoration: kInputDecorantion.copyWith(hintText: "Enter Patient ID"),
                              ),
                            ),
                            SizedBox(height: 30),
                            Container(
                              width: 260,
                              child: TextField(
                                obscureText: true,
                                controller: passwordcontroller,
                                style: TextStyle(color: Colors.black),
                                decoration: kInputDecorantion.copyWith(hintText: 'Enter your password',),
                              ),
                            ),
                            SizedBox(height: 60),
                            RoundButton(color: Color(0XFFE901579B),text: "Login as Patient", textColor: Colors.white,
                              onpress: ()async{
                                final progress = ProgressHUD.of(context);

                                if(userController.text.length <=4 || passwordcontroller.text.length <=4)
                                {
                                  CoolAlert.show(
                                    context: context,
                                    type: CoolAlertType.error,
                                    text: " Entry too Short !",
                                  );
                                  setState(() {
                                    userController.text='';
                                    passwordcontroller.text='';
                                  });
                                }
                                else{
                                  progress.show();
                                  var response = await instance.getPatientProfile(userController.text,passwordcontroller.text);
                                  progress.dismiss();

                                  if(response==400)
                                  {
                                    CoolAlert.show(
                                      context: context,
                                      type: CoolAlertType.error,
                                      text: " Invalid User !",
                                    );
                                    setState(() {
                                      userController.text='';
                                      passwordcontroller.text='';
                                    });
                                  }
                                  else{

                                    Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context){
                                      return PatientInfo(data: response);
                                    }), (route) => false);
                                  }
                                }


                              }

                              ,height: 50,width: 260,),


                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
      ),
    );
  }
}
