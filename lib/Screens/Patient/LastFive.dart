import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:patient_status_app/Components/LastFiveCard.dart';
import 'package:patient_status_app/Model/Networking.dart';
class LastFive extends StatefulWidget {
  final String id;
  LastFive({this.id});
  @override
  _LastFiveState createState() => _LastFiveState();
}

class _LastFiveState extends State<LastFive> {
  var res=[];
  @override
  void initState() {
    this.response(widget.id);
  }
  response(id)async {
    var resp = await Networking().lastFiveStat(id);
    if(resp == "Patient Health history doesn't exits ")
      {
        CoolAlert.show(
          context: context,
          type: CoolAlertType.error,
          text: "Patient Health history doesn't exits ",
        );
      }
    setState(() {
      res = resp;
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
    Scaffold(
      appBar: AppBar(backgroundColor: Color(0XFFD5031A8D),shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(20),bottomLeft: Radius.circular(20))
      ),leading: IconButton(icon:Icon(Icons.arrow_back),onPressed: (){Navigator.pop(context);},),),
      body: ListView.builder(
          itemCount: res.length,
          itemBuilder: (context , index){
        return Padding(padding: const EdgeInsets.only(left: 5 , right: 5),
          child: LastFiveCard(cond:((){if(res[index]['patient_condition'] == '1')
          {
            return "Asymptomatic";
          }
          else if(res[index]['patient_condition'] =='2')
          {
            return "Mild";
          }
          else if(res[index]['patient_condition'] == '3')
          {
            return "Moderate";
          }
          else if(res[index]['patient_condition'] == '4')
          {
            return "Severe";
          }})(),sis: res[index]['blood_pres_systolic'],dia: res[index]['blood_pres_diastolic'],
            temp: res[index]['temperature'],spo2:res[index]['oxy_level'],pulse: res[index]['pulse_rate'],),
        );
      }),
    ));
  }
}
