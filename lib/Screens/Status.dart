import 'package:flutter/material.dart';
import 'package:patient_status_app/Components/Drawer.dart';
import 'package:patient_status_app/Components/MyCard.dart';
import 'package:patient_status_app/Components/RoundButton.dart';
import 'package:patient_status_app/Utilities/Brain.dart';

import 'Nurses/NurseLogin.dart';
class Status extends StatefulWidget {
  static final String id = 'Status';
  @override
  _StatusState createState() => _StatusState();
}

class _StatusState extends State<Status> {
  Bed typeBed=Bed.NonOxyBed;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(child: MyDrawer(name: 'Shubham Tripathi',designation: 'Doctor   ; )',),),
        appBar: AppBar(backgroundColor: Color(0XFFD5031A8D),shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(20),bottomLeft: Radius.circular(20))
        ),),
        body: ListView(

          children: [
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RoundButton(text: "Normal Bed",onpress: (){
                  setState(() {
                    typeBed = Bed.NonOxyBed;
                  });
                },
                  color: typeBed == Bed.NonOxyBed ? Color(0XFFD5031A8D):Colors.white,
                  textColor: typeBed == Bed.NonOxyBed ? Colors.white:Colors.black,
                ),
                RoundButton(text: "Oxygen Bed",onpress: (){
                  setState(() {
                    typeBed = Bed.OxygenBed;
                  });
                },
                  textColor: typeBed == Bed.OxygenBed ? Colors.white:Colors.black,
                  color: typeBed == Bed.OxygenBed ? Color(0XFFD5031A8D):Colors.white,
                ),
                RoundButton(text: "Ventilator",width: 110,onpress: (){
                  setState(() {
                    typeBed = Bed.VentilatorBed;
                  });
                },color: typeBed == Bed.VentilatorBed ? Color(0XFFD5031A8D):Colors.white,
                  textColor: typeBed == Bed.VentilatorBed ? Colors.white:Colors.black,
                )
              ],
            ),
            SizedBox(height: 20,),
            Column(
              children: [
                MyCard(height: 160,width: 330,headText: 'Total Patients',headerSize: 22,valueColor: Colors.grey[600],
                  color: Colors.white,valueSize: 60,
                  /// Realtime Value
                  valueText: Brain.TotalPatients(typeBed),
                  headerColor: Colors.grey,
                ),
                SizedBox(height: 20,),
                MyCard(height: 160,width: 330,headText: 'Total Beds',headerSize: 22,valueColor: Colors.grey[600],
                  color: Colors.white,valueSize: 60,
                  /// Realtime Value
                  valueText: Brain.TotalBeds(typeBed),
                  headerColor: Colors.grey,
                ),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MyCard(height: 160,width: 160,headText: 'Occupied',headerSize: 22,valueColor: Colors.grey[600],
                  color: Colors.white,valueSize: 60,
                  /// Realtime Value
                  valueText: Brain.OccupyedBeds(typeBed),
                  headerColor: Colors.grey,
                ),
                MyCard(height: 160,width: 160,headText: 'Vacant',headerSize: 22,
                  color: Colors.white,valueSize: 60,
                  /// Realtime Value
                  valueText: Brain.VacantBeds(typeBed),
                  headerColor: Colors.grey,valueColor: Colors.grey[600],)
              ],
            ),

          ],
        ),
      ),
    );
  }
}
