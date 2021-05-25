import 'package:flutter/material.dart';
import 'package:patient_status_app/Components/RoundButton.dart';
import 'package:patient_status_app/Model/Networking.dart';
import 'package:patient_status_app/Screens/Patient/ChangeBed.dart';
import 'package:patient_status_app/Screens/Patient/ChangeStatus.dart';
import 'package:patient_status_app/Screens/Patient/LastFive.dart';
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
   int age;
   String spo2, bpUp,bpDown,temp,contact;
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
          height: 620,
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
                          Container(width: 100,
                            child: Column(
                              children: [
                                Text("Contact",style: kdarkHeader,),
                                SizedBox(height: 10,),
                                Text("$contact",style: kdarkValue,)
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              Text("Age",style: kdarkHeader,),
                              SizedBox(height: 10,),
                              Text("$age",style: kdarkValue,)
                            ],
                          ),
                          Container(width: 90,
                            child: Column(
                              children: [
                                Text("Patient ID",style: kdarkHeader,),
                                SizedBox(height: 10,),
                                Text(patientId,style: kdarkValue,)
                              ],
                            ),
                          ),

                        ],
                      ),
                      SizedBox(height: 10,),
                      Divider(),
                      SizedBox(height: 10,),
                      Row(  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container( width: 150,
                            child: Column(
                              children: [
                                Text("Address",style: kdarkHeader,),
                                SizedBox(height: 10,),
                                Container(child: Text(address,style: kdarkValue,),
                                  alignment: Alignment.center,width: 150,
                                  margin: EdgeInsets.only(left: 20,right: 20),)
                              ],
                            ),
                          ),Container( width: 150,
                            child: Column(
                              children: [
                                Text("Updated On",style: kdarkHeader,),
                                SizedBox(height: 10,),
                                Container(child: Text("${widget.response['updated_on']}".substring(0,10),style: kdarkValue,),
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.only(left: 20,right: 20),),
                              ],
                            ),
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
                              Text("Condition",style: kdarkHeader,),
                              SizedBox(height: 10,),
                              Text(condtions(),style: kdarkValue,)
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
                              Text("Vaccination",style: kdarkHeader,),
                              SizedBox(height: 10,),
                              Text(VaccineStatus(),style: kdarkValue,)
                            ],
                          ),
                          Column(
                            children: [
                              Text("Pulse Rate",style: kdarkHeader,),
                              SizedBox(height: 10,),
                              Text("${stat['pulse_rate']}",style: kdarkValue,),
                            ],
                          ),
                          Column(
                            children: [
                              Text("Test Result",style: kdarkHeader,),
                              SizedBox(height: 10,),
                              Text(TestStatus(),style: kdarkValue,),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 30,),
                      ((){
                        if(widget.designation=="NURSE")
                          {return Column(
                            children: [
                               InkWell(child: Text("Last 5 Days Report   >",
                                 style: TextStyle(fontWeight: FontWeight.w600),),onTap: (){Navigator.push(context,
                                   MaterialPageRoute(builder: (context){return LastFive(id: patientId,);}));},),
                              SizedBox(height: 30,),
                              RoundButton(color: Color(0XFFD5031A8D),text: "Health Check", textColor: Colors.white,
                                onpress: (){Navigator.pushReplacement(context, MaterialPageRoute(
                                    builder: (context){return PatientForm(patientName: patient,patient_id: patientId,token: widget.token,);}));} ,height: 50,width: 260,)
                            ],
                          );
                          }
                        else if(widget.designation=='DOCTOR')
                          { return Column(
                            children: [
                              InkWell(child: Text("Last 5 Days Report   >",
                                style: TextStyle(fontWeight: FontWeight.w600),),onTap: (){Navigator.push(context,
                                  MaterialPageRoute(builder: (context){return LastFive(id: patientId,);}));},),
                              SizedBox(height: 30,),
                              Row(  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  RoundButton(color: Color(0XFFD5031A8D),text: "Change Status", textColor: Colors.white,
                                    onpress: (){Navigator.pushReplacement(context, MaterialPageRoute(
                                        builder: (context){return ChangeStatus(id: patientId,);}));} ,height: 50,width: 120,),
                                  RoundButton(color: Color(0XFFD5031A8D),text: "Change Bed", textColor: Colors.white,
                                    onpress: (){Navigator.pushReplacement(context, MaterialPageRoute(
                                        builder: (context){return ChangeBed(id: patientId,);}));} ,height: 50,width: 120,),
                                ],
                              ),
                            ],
                          );}
                        else {
                           return Column(
                             children: [
                               SizedBox(height: 40,),
                               RoundButton(color: Color(0XFFD5031A8D),text: "Last 5 Days Report", textColor: Colors.white,
                                 onpress: (){Navigator.push(context,
                                     MaterialPageRoute(builder: (context){return LastFive(id: patientId,);}));} ,height: 50,width: 160,),
                             ],
                           );
                        }
                      })()
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

  String condtions(){
    if(condition == '1')
      {
        return "Asymptomatic";
      }
    else if(condition =='2')
      {
        return "Mild";
      }
    else if(condition == '3')
      {
        return "Moderate";
      }
    else if(condition == '4')
      {
        return "Severe";
      }
  }
  String TestStatus(){
    if(widget.response["patient_covid_test"]==null || widget.response["patient_covid_test"]["is_tested"]==false )
      {
        return "Not Tested";
      }
    else if(widget.response["patient_covid_test"]["is_tested"]==true)
      {
        if(widget.response["patient_covid_test"]['result']=='1')
          {
            return "Positive";
          }
        else if(widget.response["patient_covid_test"]['result']=='2')
          {
            return 'Negative';
          }
        else if(widget.response["patient_covid_test"]['result']=='3')
          {
            return 'Awaited';
          }
        else if(widget.response["patient_covid_test"]['result']=='4')
          {
            return 'Rejected';
          }
      }

  }
   String VaccineStatus(){
     if(widget.response["patient_vaccine_status"]==null || widget.response["patient_vaccine_status"]["is_vaccinated"]==false)
     {
       return "Not Vaccinated";
     }
     else if(widget.response["patient_vaccine_status"]["is_vaccinated"]==true)
     {
       if(widget.response["patient_vaccine_status"]['vaccine_status'].length==1)
       {
         return "One Dose";
       }
       else if(widget.response["patient_vaccine_status"]['vaccine_status'].length>=2)
       {
         return 'Both Dose';
       }
     }

   }
}
