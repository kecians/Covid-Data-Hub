import 'package:flutter/material.dart';
import 'package:patient_status_app/Components/RoundButton.dart';
import 'package:patient_status_app/Screens/Patient/ChangeBed.dart';
import 'package:patient_status_app/Screens/Patient/ChangeStatus.dart';
import 'package:patient_status_app/Screens/Patient/PatientForm.dart';
import 'package:patient_status_app/Utilities/constants.dart';
class InfoDischarged extends StatelessWidget {
  final data,desgination,token;
  InfoDischarged({this.data,this.desgination,this.token});
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(backgroundColor: Color(0XFFD5031A8D),shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(20),bottomLeft: Radius.circular(20))
      ),),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 10,right: 10,top: 20),
          height: 500,
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
                        Container(child: Text('${data['name']}',style: kdarkValue,),width: 80,alignment: Alignment.center,)
                      ],
                    ),
                    Column(
                      children: [
                        Text("Status",style: kdarkHeader,),
                        SizedBox(height: 10,),
                       Text(Status(),style: kdarkValue,)
                      ],
                    ),
                    Column(
                      children: [
                        Text("Gender",style: kdarkHeader,),
                        SizedBox(height: 10,),
                        Text('${data['gender']}',style: kdarkValue,)
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
                          Text("${data['contact_number']}",style: kdarkValue,)
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Text("Age",style: kdarkHeader,),
                        SizedBox(height: 10,),
                        Text("${data['age']}",style: kdarkValue,)
                      ],
                    ),
                    Container(width: 90,
                      child: Column(
                        children: [
                          Text("Patient ID",style: kdarkHeader,),
                          SizedBox(height: 10,),
                          Text('${data['patient_id']}',style: kdarkValue,)
                        ],
                      ),
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
                    Container(child: Text('${data['address']}',style: kdarkValue,),
                      width: double.infinity,alignment: Alignment.center,
                      margin: EdgeInsets.only(left: 20,right: 20),)
                  ],
                ),
                SizedBox(height: 10,),
                Divider(),
                SizedBox(height: 10,),
                ((){
                  if(data['patient_status']=='M')
                    {
                       return Column(
                         children: [
                           Row(
                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                             children: [
                               Column(
                                 children: [
                                   Text("Referred To",style: kdarkHeader,),
                                   SizedBox(height: 10,),
                                   Text('${data['patient_migrate']['migrated_to']}',style: kdarkValue,)
                                 ],
                               ),
                               Column(
                                 children: [
                                   Text("Referred On",style: kdarkHeader,),
                                   SizedBox(height: 10,),
                                 Text('${data['patient_migrate']['migrated_on']}'.substring(0,10),style: kdarkValue,)
                                 ],
                               ),
                             ],
                           ),
                           SizedBox(height: 20,),
                           Column(
                             children: [
                               Text("Reason",style: kdarkHeader,),
                               SizedBox(height: 10,),
                              Container(child: Text('${data['patient_migrate']['reason']}',style: kdarkValue,)
                                ,width: double.infinity,margin: EdgeInsets.only(left: 20,right: 20),alignment: Alignment.center,
                               )
                             ],
                           ),
                         ],
                       );
                    }
                  else if(data['patient_status']=='A'){
                      return Column(
                        children: [
                          SizedBox(height:60),
                          ((){
                            if(desgination=="NURSE")
                            {return RoundButton(color: Color(0XFFD5031A8D),text: "Health Check", textColor: Colors.white,
                              onpress: (){Navigator.pushReplacement(context, MaterialPageRoute(
                                  builder: (context){return PatientForm(patientName:data['name'],patient_id:data['patient_id'],token:token,);}));} ,height: 50,width: 260,);
                            }
                            else if(desgination=='DOCTOR')
                            { return Row(  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                RoundButton(color: Color(0XFFD5031A8D),text: "Change Status", textColor: Colors.white,
                                  onpress: (){Navigator.pushReplacement(context, MaterialPageRoute(
                                      builder: (context){return ChangeStatus(id:data['patient_id']);}));} ,height: 50,width: 120,),
                                RoundButton(color: Color(0XFFD5031A8D),text: "Change Bed", textColor: Colors.white,
                                  onpress: (){Navigator.pushReplacement(context, MaterialPageRoute(
                                      builder: (context){return ChangeBed(id:data['patient_id']);}));} ,height: 50,width: 120,),
                              ],
                            );}
                            else {
                              return SizedBox(height: 20,);
                            }
                          })()
                        ],
                      );
                  }
                  else{
                    return SizedBox(height: 20,);
                  }
                })(),
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
  String Status(){
    if(data['patient_status']=='M')
      {
        return "Referred";
      }
    else if(data['patient_status']=='R')
      {
        return "Recovereed";
      }
    else if(data['patient_status']=='D')
      {
        return "Death";
      }
    else if(data['patient_status']=='A')
      {
        return "Active";
      }
    else if(data['patient_status']=='H')
      {
        return "Home Isolated";
      }
  }
}
