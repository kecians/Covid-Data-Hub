import 'package:flutter/material.dart';
import 'package:patient_status_app/Components/DetailCard.dart';
import 'package:patient_status_app/Components/Drawer.dart';
import 'package:patient_status_app/Components/MyCard.dart';
import 'package:patient_status_app/Components/RoundButton.dart';

import 'Patient/AddPatient.dart';
class Status extends StatefulWidget {
  static final String id = 'Status';
  final data;
  final responseList;
  Status({this.data,this.responseList});
  @override
  _StatusState createState() => _StatusState();
}

class _StatusState extends State<Status> {
  int ox,gen,ven,icu,availox,availgen,availicu,availven,total,alloted;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    update(widget.data);
  }

  void update(dynamic data)
  {
    gen = data['generalBeds'];
    ven = data['ventilatorBeds'];
    ox = data['oxygenBeds'];
    icu = data['icuBeds'];
    availgen =data['generalBeds'] - data['allotedGenBeds'];
    availicu =data['icuBeds'] - data['allotedIcuBeds'];
    availox =data['oxygenBeds'] - data['allotedOxyBeds'];
    availven =data['ventilatorBeds'] - data['allotedVenBeds'];
    total = data['totalBeds'];
    alloted = data['allotedTotal'];

  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(child: MyDrawer(name: widget.responseList[2],designation: widget.responseList[1]== "NURSE" ? "DEO": widget.responseList[1],responsedata: widget.responseList)),
        appBar: AppBar(backgroundColor: Color(0XFFD5031A8D),shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(20),bottomLeft: Radius.circular(20))
        ),),
        body: ListView(

          children: [
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MyCard(height: 120,width: 160,headText: 'Allotted Beds',headerSize: 17,valueColor: Colors.blueGrey[600],
                  color: Colors.white,valueSize: 30,
                  /// Realtime Value
                  valueText: "$alloted",
                  headerColor: Colors.blueGrey,
                ),

                MyCard(height: 120,width: 160,headText: 'Total Beds',headerSize: 17,valueColor: Colors.blueGrey[600],
                  color: Colors.white,valueSize: 30,
                  /// Realtime Value
                  valueText: "$total",
                  headerColor: Colors.blueGrey,
                )
              ],
            ),
            SizedBox(height: 20,),

               DetailCard(valueGen: availgen,valueIcu: availicu,valueOxy: availox,valueVen: availven,TotalGen: gen,TotalIcu: icu,
                 TotalOxy: ox,TotalVen: ven,height: 300,
                 color: Colors.white,),
            SizedBox(height: 60,),
            widget.responseList[1] == "NURSE" ? Center(
              child: RoundButton(color: Color(0XFFD5031A8D),text: "Add  Patient", textColor: Colors.white,
                onpress: (){Navigator.push(context, MaterialPageRoute(
                    builder: (context){return AddPatient();}));},height: 50,width: 260,),
            ) :
            Row(  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RoundButton(color: Color(0XFFD5031A8D),text: "Deaths", textColor: Colors.white,
                  onpress: (){},height: 50,width: 100,),
                RoundButton(color: Color(0XFFD5031A8D),text: "Migrated", textColor: Colors.white,
                  onpress: (){},height: 50,width: 100,),
                RoundButton(color: Color(0XFFD5031A8D),text: "Recovered", textColor: Colors.white,
                  onpress: (){},height: 50,width: 100,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
