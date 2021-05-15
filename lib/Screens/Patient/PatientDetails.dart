import 'package:flutter/material.dart';
import 'package:patient_status_app/Components/RoundButton.dart';
import 'package:patient_status_app/Screens/Patient/PatientForm.dart';
import 'package:patient_status_app/Utilities/constants.dart';
class PatientDetails extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
        appBar: AppBar(backgroundColor: Color(0XFFD5031A8D),shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(20),bottomLeft: Radius.circular(20))
        ),),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 10,right: 10,top: 20),
          height: 600,
          child: Center(
            child: Column(
                    children: [
                    SizedBox(height: 30,),
                    Text('Patient Details',style: TextStyle(color: Colors.blue[900],fontSize: 24,
                      fontWeight: FontWeight.w700,),),
                    SizedBox(height: 20),
                    Divider(),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text("Name",style: kdarkHeader,),
                            SizedBox(height: 10,),
                            Container(child: Text('Seema',style: kdarkValue,),width: 80,alignment: Alignment.center,)
                          ],
                        ),
                        Column(
                          children: [
                            Text("Status",style: kdarkHeader,),
                            SizedBox(height: 10,),
                            Text('Active',style: kdarkValue,)
                          ],
                        ),
                        Column(
                          children: [
                            Text("Gender",style: kdarkHeader,),
                            SizedBox(height: 10,),
                            Text('F',style: kdarkValue,)
                          ],
                        ),
                      ],
                    ),
                      SizedBox(height: 10,),
                      Divider(),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Text("Contact",style: kdarkHeader,),
                              SizedBox(height: 10,),
                              Text('41947141084',style: kdarkValue,)
                            ],
                          ),
                          Column(
                            children: [
                              Text("Age",style: kdarkHeader,),
                              SizedBox(height: 10,),
                              Text('20',style: kdarkValue,)
                            ],
                          ),
                          Column(
                            children: [
                              Text("Patient ID",style: kdarkHeader,),
                              SizedBox(height: 10,),
                              Text('201312141',style: kdarkValue,)
                            ],
                          ),

                        ],
                      ),
                      SizedBox(height: 10,),
                      Divider(),
                      SizedBox(height: 10,),
                      Column(
                        children: [
                          Text("Address",style: kdarkHeader,),
                          SizedBox(height: 10,),
                          Text('JFcf afhilafndd faofanfab  afbbalf',style: kdarkValue,)
                        ],
                      ),
                      SizedBox(height: 10,),
                      Divider(),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Text("Condition",style: kdarkHeader,),
                              SizedBox(height: 10,),
                              Text('Severe',style: kdarkValue,)
                            ],
                          ),
                          Column(
                            children: [
                              Text("B P",style: kdarkHeader,),
                              SizedBox(height: 10,),
                              Text('20/10',style: kdarkValue,)
                            ],
                          ),
                          Column(
                            children: [
                              Text("SPO2 Level",style: kdarkHeader,),
                              SizedBox(height: 10,),
                              Text('20',style: kdarkValue,)
                            ],
                          ),


                        ],
                      ),
                      SizedBox(height: 30,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Text("Temperature",style: kdarkHeader,),
                              SizedBox(height: 10,),
                              Text('98 °F',style: kdarkValue,)
                            ],
                          ),
                          Column(
                            children: [
                              Text("Last Updated",style: kdarkHeader,),
                              SizedBox(height: 10,),
                              Text('20/10',style: kdarkValue,)
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 40,),
                      RoundButton(color: Color(0XFFD5031A8D),text: "Health Check", textColor: Colors.white,
                        onpress: (){Navigator.push(context, MaterialPageRoute(
                            builder: (context){return PatientForm();}));} ,height: 50,width: 260,),
                  ],
            ),
          ),
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(20)
          ),
        ),
      ),
    ));
  }
  }
