import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:patient_status_app/Components/Cards/CovidInfo.dart';
import 'package:patient_status_app/Components/Cards/General_Info.dart';
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
   String frstDate,secDate;
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
        appBar: AppBar(backgroundColor: Colors.lightBlue[900],shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(20),bottomLeft: Radius.circular(20))
        ),),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 10,right: 10,top: 20),
          height: 630,
          child: Center(
            child: Column(
                    children: [
                    SizedBox(height: 20,),
                    Text('Patient Details',style: TextStyle(color: Colors.lightBlue[900],fontSize: 24,
                      fontWeight: FontWeight.w700,),),
                    SizedBox(height: 20),
                      SizedBox(
                          height: 400.0,
                          width: 350.0,
                          child: Carousel(
                            images: [
                              Padding(
                                padding: const EdgeInsets.only(top: 5,bottom: 5),
                                child: General_Info(name: patient,age: age,address: address,condition:condtions()
                                    ,gender: gender,patId: patientId,bedNo: "X",contact: contact),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5,bottom: 5),
                                child: CovidInfo(result: TestStatus(),type: TestType(),vaccination: VaccineStatus(),
                                    vaccine: VaccineName()),
                              ),

                            ],
                            dotSize: 0.0,
                            dotBgColor: Colors.transparent,
                            borderRadius: true,
                            autoplay: false,
                          )
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
                              RoundButton(color: Colors.lightBlue[900],text: "Health Check", textColor: Colors.white,
                                onpress: (){Navigator.pushReplacement(context, MaterialPageRoute(
                                    builder: (context){return PatientForm(patientName: patient,patient_id: patientId,token: widget.token,);
                                    }));} ,height: 50,width: 260,)
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
                                  RoundButton(color: Colors.lightBlue[900],text: "Change Status", textColor: Colors.white,
                                    onpress: (){Navigator.pushReplacement(context, MaterialPageRoute(
                                        builder: (context){return ChangeStatus(id: patientId,);}));} ,height: 50,width: 120,),
                                  RoundButton(color: Colors.lightBlue[900],text: "Change Bed", textColor: Colors.white,
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
                               RoundButton(color:Colors.lightBlue[900],text: "Last 5 Days Report", textColor: Colors.white,
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
   String TestType(){
     if(widget.response["patient_covid_test"]==null || widget.response["patient_covid_test"]["is_tested"]==false )
     {
       return "Not Tested";
     }
     else if(widget.response["patient_covid_test"]["is_tested"]==true)
     {
       if(widget.response["patient_covid_test"]['type']=='1')
       {
         return "Rapid AntiGen";
       }
       else if(widget.response["patient_covid_test"]['type']=='2')
       {
         return 'RT-PCR';
       }
       else if(widget.response["patient_covid_test"]['type']=='3')
       {
         return 'TrueNat';
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
       {  String frstDate = widget.response["patient_vaccine_status"]['vaccine_status'][0]['vaccinated_on'];
         return "One Dose";
       }
       else if(widget.response["patient_vaccine_status"]['vaccine_status'].length>=2)
       { String frstDate = widget.response["patient_vaccine_status"]['vaccine_status'][0]['vaccinated_on'];
       String secDate = widget.response["patient_vaccine_status"]['vaccine_status'][1]['vaccinated_on'];
         return "Both Dose";
       }
     }

   }
   String VaccineName(){
     if(widget.response["patient_vaccine_status"]==null || widget.response["patient_vaccine_status"]["is_vaccinated"]==false)
     {
       return "Not Vaccinated";
     }
     else if(widget.response["patient_vaccine_status"]["is_vaccinated"]==true)
     {
       if(widget.response["patient_vaccine_status"]['vaccine_status'][0]['type']=='1')
       {
         return "CoviShield";
       }
       else if(widget.response["patient_vaccine_status"]['vaccine_status'][0]['type']=='2')
       {
         return 'Covaxine';
       }
     }

   }

}
