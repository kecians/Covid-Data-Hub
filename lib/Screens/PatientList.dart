import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:patient_status_app/Components/PatientListCard.dart';
import 'package:patient_status_app/Components/RoundButton.dart';
import 'package:patient_status_app/Components/SearchBar.dart';
import 'package:patient_status_app/Model/Networking.dart';
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
  var res=[];
  void data(data){
    user = data[2];
    designation = data[1];
    _token = data[3];
  }
  @override
  void initState() {
    // TODO: implement initState
    data(widget.data);
    this.response(widget.data[3]);
  }
  response(_token)async {
    var resp = await Networking().getPatientList(_token);
    setState(() {
      res = resp;
    });
  }

  @override
  Widget build(BuildContext context){
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(backgroundColor: Color(0XFFD5031A8D),shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(20),bottomLeft: Radius.circular(20))
          ),leading: IconButton(icon:Icon(Icons.arrow_back),onPressed: (){Navigator.pop(context);},),),
          bottomNavigationBar: widget.data[1]=='NURSE' ? Container(color: Color(0XFFD5031A8D),
            child: RoundButton(color: Color(0XFFD5031A8D),text: "Add  Patient", textColor: Colors.white,
              onpress: (){Navigator.push(context, MaterialPageRoute(
                  builder: (context){return AddPatient();}));} ,height: 50,width: 260,),
          ) : null,
          body: Column(
              children: [
                SizedBox(height: 10,),
                SearchBar(),
                SizedBox(height: 10,),
                Container(child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Patient Name',style: kwhite),
                    Text('Bed Number',style: kwhite),
                    Text('Admitted On',style: kwhite)
                  ],
                ),height: 50,width: double.infinity,
                  color: Colors.blueGrey[900],
                ),
                SizedBox(height: 10,),
                Expanded(child: Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10),
                    child: ListView.builder(itemCount: res.length,
                        itemBuilder:(context , index){
                          return PatientListCard(patientName: res[index]['name'] ,isBed:res[index]['patient_bed'],admittedOn: res[index]["created_on"],onPress: (){Navigator.push(context
                              , MaterialPageRoute(builder:(context){return PatientDetails(response: res[index],token: _token,designation:widget.data[1],);}));});
                        })
                ),
                ),
              ]
          ),
        )
    );
  }
}