import 'package:flutter/material.dart';
import 'package:patient_status_app/Components/RoundButton.dart';
import 'package:patient_status_app/Screens/Patient/LastFive.dart';
import 'package:patient_status_app/Utilities/constants.dart';

class PatientInfo extends StatefulWidget {
  final data;
  PatientInfo({this.data});
  @override
  _PatientInfoState createState() => _PatientInfoState();
}

class _PatientInfoState extends State<PatientInfo> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(backgroundColor: Colors.lightBlue[900],shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(20),bottomLeft: Radius.circular(20))
      ),),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 10,right: 10,top: 20),
          height: 580,
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 30,),
                Text('Patient Details',style: TextStyle(color:Colors.lightBlue[900],fontSize: 24,
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
                        Container(child: Text('${widget.data['name']}',style: kdarkValue,),width: 80,alignment: Alignment.center,)
                      ],
                    ),
                    Column(
                      children: [
                        Text("Status",style: kdarkHeader,),
                        SizedBox(height: 10,),
                        Text('${widget.data['patient_status']}',style: kdarkValue,)
                      ],
                    ),
                    Column(
                      children: [
                        Text("Gender",style: kdarkHeader,),
                        SizedBox(height: 10,),
                        Text('${widget.data['gender']}',style: kdarkValue,)
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
                          Text("${widget.data['contact_number']}",style: kdarkValue,)
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Text("Age",style: kdarkHeader,),
                        SizedBox(height: 10,),
                        Text("${widget.data['age']}",style: kdarkValue,)
                      ],
                    ),
                    Container(width: 90,
                      child: Column(
                        children: [
                          Text("Patient ID",style: kdarkHeader,),
                          SizedBox(height: 10,),
                          Text('${widget.data['patient_id']}',style: kdarkValue,)
                        ],
                      ),
                    ),

                  ],
                ),
                SizedBox(height: 10,),
                Divider(),
                SizedBox(height: 10,),
                Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                  Container(  width: 160,
                    child: Column(
                      children: [
                        Text("Address",style: kdarkHeader,),
                        SizedBox(height: 10,),
                        Container(child: Text('${widget.data['address']}',style: kdarkValue,),
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(left: 20,right: 20),)
                      ],
                    ),
                  ),
                  Container( width: 160,
                    child: Column(
                      children: [
                        Text("Admitted On",style: kdarkHeader,),
                        SizedBox(height: 10,),
                        Text("${widget.data['created_on']}".substring(0,10),style: kdarkValue,)
                      ],
                    ),
                  ),
                ],),
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
                        Text("Bed Number",style: kdarkHeader,),
                        SizedBox(height: 10,),
                        Text("${widget.data['bed_number']}",style: kdarkValue,)
                      ],
                    ),
                    Column(
                      children: [
                        Text("Updated On",style: kdarkHeader,),
                        SizedBox(height: 10,),
                        Text("${widget.data['updated_on']}".substring(0,10),style: kdarkValue,)
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 30,),


                Column(
                      children: [
                        SizedBox(height: 40,),
                        RoundButton(color: Colors.lightBlue[900],text: "Last 5 Days Report", textColor: Colors.white,
                          onpress: (){Navigator.push(context, MaterialPageRoute(builder: (context){return LastFive(id: widget.data['patient_id']);}));} ,height: 50,width: 160,),
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
  String condtions(){
    if(widget.data['health_condition'] == '1')
    {
      return "Asymptomatic";
    }
    else if(widget.data['health_condition'] =='2')
    {
      return "Mild";
    }
    else if(widget.data['health_condition'] == '3')
    {
      return "Moderate";
    }
    else if(widget.data['health_condition'] == '4')
    {
      return "Severe";
    }
  }
}
