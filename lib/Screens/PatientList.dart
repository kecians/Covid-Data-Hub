import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:patient_status_app/Components/PatientListCard.dart';
import 'package:patient_status_app/Components/RoundButton.dart';
import 'package:patient_status_app/Components/SearchBar.dart';
import 'package:patient_status_app/Model/Networking.dart';
import 'package:patient_status_app/Screens/LoadingScreen.dart';
import 'package:patient_status_app/Screens/Patient/AddPatient.dart';
import 'package:patient_status_app/Screens/Patient/PatientDetails.dart';
import 'package:patient_status_app/Utilities/constants.dart';
class PatientList extends StatefulWidget {
  final data;
  PatientList({this.data});
  static const String id = 'NurseLogin';
  @override
  _PatientListState createState() => _PatientListState();
}

class _PatientListState extends State<PatientList> {
  String user,designation;
  String _token;
  List res=[];
  void data(data){
    user = data[2];
    designation = data[1];
    _token = data[3];
  }
  @override
  void initState() {
    super.initState();
    data(widget.data);
    this.response(widget.data[3]);
  }
  response(_token)async {
    var resp = await Networking().getPatientList(_token);
    if (resp.isEmpty==true){
      setState(() {

      });
    }
    else{setState(() {
      res = resp;
    });}
  }

  @override
  Widget build(BuildContext context){
    return RefreshIndicator(
      child: Scaffold(
        bottomNavigationBar: widget.data[1]=='NURSE' ? Container(color: Colors.lightBlue[900],
          child: RoundButton(color: Colors.lightBlue[900],text: "Add  Patient", textColor: Colors.white,
            onpress: (){Navigator.push(context, MaterialPageRoute(
                builder: (context){return AddPatient(token:widget.data[3]);}),);} ,height: 50,width: 260,),
        ) : null,
        body: ProgressHUD(
          child: Builder(
            builder: (context){
              final progress = ProgressHUD.of(context);
              return Column(
                  children: [
                    SizedBox(height: 10,),
                    SearchBar(designation: widget.data[1],token: widget.data[3],),
                    SizedBox(height: 10,),
                    Container(child: Padding(
                      padding: const EdgeInsets.only(left: 8,right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Patient Name',style: kwhite),
                          Text('Bed Number',style: kwhite),
                          Text('Condition',style: kwhite)
                        ],
                      ),
                    ),height: 50,width: double.infinity,
                      color: Colors.blueGrey[900],
                    ),
                    res.length==0? Expanded(child: Center(child: CircularProgressIndicator(color: Colors.lightBlue[900])),) :
                    Expanded( child: ListView.builder(itemCount: res.length,itemBuilder:(context , index){
                      return Padding( padding: const EdgeInsets.only(left: 5 , right: 5),
                        child: PatientListCard(patientName: res[index]['name'],isBed:res[index]['patient_bed'],
                            patCondition:res[index]["health_condition"],onPress: (){

                              if( res[index]['age']==null ||res[index]['address'] == null
                                  || res[index]['contact_number'] == null ) {
                                CoolAlert.show(
                                  context: context,
                                  type: CoolAlertType.error,
                                  text: "Data Insufficient!",
                                );
                              }
                              else{
                                Navigator.push(context
                                    , MaterialPageRoute(builder:(context){return PatientDetails(response: res[index],
                                      token: _token,designation:widget.data[1],);}));
                              }

                            }),
                      );
                    }
                    ),
                    ),

                  ]
              );
            }
          ),
        )
      ),
      onRefresh: () async {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => Loading_Screen()));
        await Future.value({});
      },
    );
  }

}