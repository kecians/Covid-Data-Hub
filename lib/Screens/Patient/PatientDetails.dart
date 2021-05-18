import 'package:flutter/material.dart';
import 'package:patient_status_app/Components/RoundButton.dart';
import 'package:patient_status_app/Model/Networking.dart';
import 'package:patient_status_app/Screens/Patient/ChangeBed.dart';
import 'package:patient_status_app/Screens/Patient/ChangeStatus.dart';
import 'package:patient_status_app/Screens/Patient/PatientForm.dart';
import 'package:patient_status_app/Utilities/constants.dart';
class PatientDetails extends StatefulWidget {
  final response;
  final String token,designation;
  PatientDetails({this.response,this.token,this.designation});

  @override
  _PatientDetailsState createState() => _PatientDetailsState();
}

class _PatientDetailsState extends State<PatientDetails> {
   String patient,status,gender,patientId,address,condition;
   int age,contact;
   String spo2, bpUp,bpDown,temp;
   var stat={};
  dataList(){
    patient = widget.response['name'];
    status = widget.response['patient_status'];
    gender = widget.response['gender'];
    contact = widget.response['contact_number'];
    age = widget.response['age'];
    patientId = widget.response['patient_id'];
    address = widget.response['address'];
    condition = widget.response['health_condition'];
  }
   @override
  void initState() {
    super.initState();
    this.dataList();
    this.Stat(widget.response['patient_id']);
  }
  Stat(id) async{
    var res = await Networking().lastStat(id);
    print(res['patient_condition']);
    setState(() {
      stat = res;
    });
  }

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
                            Container(child: Text(patient,style: kdarkValue,),width: 80,alignment: Alignment.center,)
                          ],
                        ),
                        Column(
                          children: [
                            Text("Status",style: kdarkHeader,),
                            SizedBox(height: 10,),
                            Text(status,style: kdarkValue,)
                          ],
                        ),
                        Column(
                          children: [
                            Text("Gender",style: kdarkHeader,),
                            SizedBox(height: 10,),
                            Text(gender,style: kdarkValue,)
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
                              Text("$contact",style: kdarkValue,)
                            ],
                          ),
                          Column(
                            children: [
                              Text("Age",style: kdarkHeader,),
                              SizedBox(height: 10,),
                              Text("$age",style: kdarkValue,)
                            ],
                          ),
                          Column(
                            children: [
                              Text("Patient ID",style: kdarkHeader,),
                              SizedBox(height: 10,),
                              Text(patientId,style: kdarkValue,)
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
                          Text(address,style: kdarkValue,)
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
                              Text(condition,style: kdarkValue,)
                            ],
                          ),
                          Column(
                            children: [
                              Text("B P",style: kdarkHeader,),
                              SizedBox(height: 10,),
                              Text('${stat['blood_pres_systolic']} / ${stat['blood_pres_diastolic']}',style: kdarkValue,)
                            ],
                          ),
                          Column(
                            children: [
                              Text("SPO2 Level",style: kdarkHeader,),
                              SizedBox(height: 10,),
                              Text("${stat['oxy_level']}",style: kdarkValue,)
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
                              Text('${stat['temperature']} °F',style: kdarkValue,)
                            ],
                          ),
                          Column(
                            children: [
                              Text("Pulse Rate",style: kdarkHeader,),
                              SizedBox(height: 10,),
                              Text("${stat['pulse_rate']}",style: kdarkValue,),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 40,),
                      widget.designation=="NURSE" ? RoundButton(color: Color(0XFFD5031A8D),text: "Health Check", textColor: Colors.white,
                        onpress: (){Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (context){return PatientForm(patientName: patient,patient_id: patientId,token: widget.token,);}));} ,height: 50,width: 260,)
                          :
                          Row(  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              RoundButton(color: Color(0XFFD5031A8D),text: "Change Status", textColor: Colors.white,
                                onpress: (){Navigator.pushReplacement(context, MaterialPageRoute(
                                    builder: (context){return ChangeStatus(id: patientId,);}));} ,height: 50,width: 120,),
                              RoundButton(color: Color(0XFFD5031A8D),text: "Change Bed", textColor: Colors.white,
                                onpress: (){Navigator.pushReplacement(context, MaterialPageRoute(
                                    builder: (context){return ChangeBed(id: patientId,);}));} ,height: 50,width: 120,),
                            ],
                          )
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
