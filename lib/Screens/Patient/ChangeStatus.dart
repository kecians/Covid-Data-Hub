import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:patient_status_app/Components/MyTextField.dart';
import 'package:patient_status_app/Components/RoundButton.dart';
import 'package:patient_status_app/Model/Networking.dart';
import 'package:patient_status_app/Model/Toast.dart';
import 'package:patient_status_app/Screens/LoadingScreen.dart';
class ChangeStatus extends StatefulWidget {
  final id;
  ChangeStatus({this.id});
  @override
  _ChangeStatusState createState() => _ChangeStatusState();
}

class _ChangeStatusState extends State<ChangeStatus> {
  String dropdownValue = "Select Status";
  String migratedTo,migReason,deathReason;
  Networking instance = Networking();
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: ProgressHUD(
        child: Builder(
          builder: (context)=>Scaffold(
            appBar: AppBar(
              backgroundColor: Color(0XFFD5031A8D), shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20), bottomLeft: Radius.circular(20))
            ),),
            body: Center(

              child: ListView(

                children: [
                  Column(
                    children: [
                      SizedBox(height: 60,),
                      Text('Change Patient Status',
                        style: TextStyle(color: Colors.blue[900], fontSize: 26,
                          fontWeight: FontWeight.w900,),),
                      SizedBox(height: 60,),
                      Container(
                        child: Center(child: Text('${widget.id}',style: TextStyle(fontSize: 18))),
                        width: 260,height: 50,
                        decoration: BoxDecoration(
                            border: Border.all(color: Color(0XFFD5031A8D)),
                            borderRadius: BorderRadius.circular(32)
                        ),
                      ),
                      SizedBox(height: 30),
                      DropDown(),
                      SizedBox(height: 30),
                      ((){
                        if(dropdownValue == "Migrated")
                        {return Column(
                          children: [
                            MyTextField(
                              text: "Reason of Migration", width: 260, onPress: (value) {migReason = value;},),
                            SizedBox(height: 30,),
                            MyTextField(
                              text: "Migrated to..", width: 260, onPress: (
                                value) {migratedTo = value;},),
                            SizedBox(height: 30,)
                          ],
                        );}
                        else if(dropdownValue == 'Death')
                          {
                            return Column(
                              children: [
                                MyTextField(
                                  text: "Cause of Death..", width: 260, onPress: (
                                    value) {deathReason=value;},),
                                SizedBox(height: 30,)
                              ],
                            );
                          }
                        else {
                          return SizedBox(height: 80,);
                        }


                      })(),
                      RoundButton(color: Color(0XFFD5031A8D),
                        text: "Change",
                        textColor: Colors.white,
                        onpress: ()async {
                          final progress = ProgressHUD.of(context);
                          progress.show();
                          instance.changePatientStatus(widget.id , migratedTo, migReason, deathReason, dropdownValue);

                          if(dropdownValue == "Select Status")
                            {
                              showToast(context,"Please Select Bed Type");
                            }
                            else
                              { showToast(context, "Status Successfully Updated!");
                              Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>Loading_Screen()));
                              }

                        progress.dismiss();
                        },
                        height: 50,
                        width: 260,),
                    ],
                  ),
                ],
              ),
            ),
          ),
        )
    ));
  }
Container DropDown() {
  return Container( width: 260,
    child: Center(
      child: DropdownButton<String>(
        underline: Container(height: 0,),
        value: dropdownValue,
        icon: const Icon(Icons.arrow_drop_down_sharp),
        iconSize: 24,
        style: const TextStyle(color: Colors.blueGrey),
        onChanged: (String newValue) {
          setState(() {
            dropdownValue = newValue;
          });
        },
        items: <String>['Select Status','Migrated', 'Recovered','Death',]
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    ),
    decoration:  BoxDecoration(borderRadius: BorderRadius.circular(30),
        color: Colors.white70,
        border: Border.all(color: Colors.blue[900])
    ),

  );
}
}
