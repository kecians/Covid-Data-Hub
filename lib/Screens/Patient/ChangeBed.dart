import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:patient_status_app/Components/MyTextField.dart';
import 'package:patient_status_app/Components/RoundButton.dart';
import 'package:patient_status_app/Model/Networking.dart';
import 'package:patient_status_app/Model/Toast.dart';
import 'package:patient_status_app/Screens/LoadingScreen.dart';
class ChangeBed extends StatefulWidget {
  final id;
  ChangeBed({this.id});
  @override
  _ChangeBedState createState() => _ChangeBedState();
}

class _ChangeBedState extends State<ChangeBed> {
  String dropdownValue = 'Bed Type';
  String bedNumber;
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
                      Text("Change Patient's Bed",
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
                      SizedBox(height: 30,),
                      MyTextField(
                        text: "New Bed Number", width: 260, onPress: (value) {bedNumber = value;},inputType: TextInputType.number,),
                      SizedBox(height: 30),
                      DropDown(),
                      SizedBox(height: 60),
                      RoundButton(color: Color(0XFFD5031A8D),
                        text: "Change",
                        textColor: Colors.white,
                        onpress: ()async {
                          final progress = ProgressHUD.of(context);
                          progress.show();
                          var res = await instance.changePatientBed(widget.id,dropdownValue,bedNumber);
                          if(res == 201)
                            {
                               showToast(context, "Changed Bed Successfully");
                               Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>Loading_Screen()));
                            }
                          else
                            {
                              CoolAlert.show(
                                context: context,
                                type: CoolAlertType.error,
                                text: "Please enter a valid field!\n Bed may be allotted!",
                              );
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
          items: <String>['Bed Type','General Bed','Oxygen Bed','ICU Bed','Ventilators']
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
