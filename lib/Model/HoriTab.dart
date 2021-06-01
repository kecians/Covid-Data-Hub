import 'package:flutter/material.dart';
import 'package:patient_status_app/Components/RoundButton.dart';
import 'package:patient_status_app/MainHome.dart';
import 'package:patient_status_app/Model/LoadingScreenHome.dart';
import 'package:patient_status_app/Screens/Home.dart';
import 'package:patient_status_app/Screens/PatientList.dart';
import 'package:patient_status_app/Screens/Status.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:top_sheet/top_sheet.dart';

class Horitab extends StatefulWidget {
  final data;
  final responseList;
  Horitab({this.data,this.responseList});
  @override
  _HoritabState createState() => _HoritabState();
}

class _HoritabState extends State<Horitab> {
  SharedPreferences preferences;
  @override
  Widget build(BuildContext context) {
    List<Widget> containers = [
      Container(
        color: Colors.grey[850],
        child: Status(data: widget.data,responseList: widget.responseList),
      ),

      Container(
        color: Colors.grey[850],
        child: PatientList(data: widget.responseList),
      ),

    ];
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(icon: Icon(Icons.menu,color: Colors.white),onPressed: (){
            TopSheet.show(
              context: context,
              child: Container(
                height: 300,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 40,),
                    CircleAvatar(radius: 30, backgroundColor: Colors.grey[900], child: Icon(Icons.person),),
                    SizedBox(height: 20,),
                    Text(widget.responseList[1]== "NURSE" ? "DEO": widget.responseList[1],style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                    SizedBox(height: 40,),
                    RoundButton(color: Colors.lightBlue[900],text: "Logout",textColor: Colors.white,
                    width: 120, onpress: ()async{ preferences = await SharedPreferences.getInstance();
              preferences.setBool('isLoggedIn', false);
              Navigator.pushNamedAndRemoveUntil(context, LoadingScreenHome.id, (route) => false);},
                    )
                  ],
                ),

              ),
              direction: TopSheetDirection.TOP,
            );
          },),
          backgroundColor: Colors.lightBlue[900],
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                  child: Container(
                      child: Text(
                        "Current Status",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ))),
              Tab(
                child: Container(
                    child: Text(
                      "Patients List",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    )),
              ),
            ],
          ),
        ),
        body: TabBarView(children: containers),
      ),

    );
  }
}
