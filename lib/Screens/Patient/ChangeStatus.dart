import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:patient_status_app/Components/MyTextField.dart';
import 'package:patient_status_app/Components/RoundButton.dart';
import 'package:patient_status_app/Model/Networking.dart';
import 'package:patient_status_app/Model/Toast.dart';
import 'package:patient_status_app/Screens/LoadingScreen.dart';
import 'package:patient_status_app/Utilities/constants.dart';
class ChangeStatus extends StatefulWidget {
  final id;
  ChangeStatus({this.id});
  @override
  _ChangeStatusState createState() => _ChangeStatusState();
}

class _ChangeStatusState extends State<ChangeStatus> {
  String dropdownValue = "Select Status",dropdownValue2 = "Bed Type",floor="Select Floor",wardValue="Select Ward";
  String migratedTo,migReason,deathReason,bedNo;
  DateTime deathDate = DateTime.now();
  Networking instance = Networking();
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: ProgressHUD(
        child: Builder(
          builder: (context)=>Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.lightBlue[900], shape: RoundedRectangleBorder(
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
                        style: TextStyle(color:Colors.lightBlue[900], fontSize: 26,
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
                        if(dropdownValue == "Hospitalise"){
                          return Column(children: [
                            DropDown2(),
                            SizedBox(height: 30,),
                            MyTextField(text: 'Bed Number',
                                width: 260,
                                inputType: TextInputType.number,
                                onPress: (value) {bedNo=value;}),
                            SizedBox(height: 30,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                DropDown9(),
                                SizedBox(width: 20,),
                                DropDown11()
                              ],
                            ),
                            SizedBox(height: 30,)
                          ],);
                        }
                        else if(dropdownValue == "Referred")
                        {return Column(
                          children: [
                            MyTextField(
                              text: "Reason of Referral", width: 260, onPress: (value) {migReason = value;},),
                            SizedBox(height: 30,),
                            MyTextField(
                              text: "Referred to..", width: 260, onPress: (
                                value) {migratedTo = value;},),
                            SizedBox(height: 30,)
                          ],
                        );}
                        else if(dropdownValue == 'Death')
                          {
                            return Column(children: [
                              MyTextField(
                                  text: "Cause of Death..", width: 260, onPress: (
                                    value) {deathReason=value;},),
                                SizedBox(height: 30,),
                                Date(),
                                SizedBox(height: 30,)],);}
                        else {
                          return SizedBox(height: 80,);
                        }


                      })(),
                      RoundButton(color: Colors.lightBlue[900],
                        text: "Change",
                        textColor: Colors.white,
                        onpress: ()async {
                          final progress = ProgressHUD.of(context);
                          progress.show();
                          instance.changePatientStatus(widget.id , migratedTo, migReason, deathReason, dropdownValue
                              ,deathDate,dropdownValue2,bedNo,wardValue,floor);

                          if(dropdownValue == "Select Status")
                            {
                              showToast(context,"Please Select Bed Type");
                            }
                            else
                              { showToast(context, "Status Successfully Updated!");
                              Navigator.pushAndRemoveUntil(context,
                                  MaterialPageRoute(builder: (context)=>Loading_Screen()), (route) => false);
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
        items: <String>['Select Status','Hospitalise','Referred', 'Recovered','Death','Home Isolation']
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
  Date(){
    return Container(width: 260,
      child: DateField(
          onDateSelected: (DateTime value) {
            setState(() {
              deathDate = value;
            });
          },
          selectedDate: deathDate,
          label:null,
          decoration: kInputDecorantion
      ),

    );

  }
  Container DropDown2() {
    return Container(width: 260,padding: EdgeInsets.only(left: 10),
      child: Center(
        child: DropdownButton<String>(
          underline: Container(height: 0,),
          value: dropdownValue2,
          icon: const Icon(Icons.arrow_drop_down_sharp),
          iconSize: 24,
          style: const TextStyle(color: Colors.blueGrey),
          onChanged: (String newValue) {
            setState(() {
              dropdownValue2 = newValue;
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
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),
          color: Colors.white70,
          border: Border.all(color: Colors.blue[900])
      ),

    );
  }
  Container DropDown9() {
    return Container(width: 120,padding: EdgeInsets.only(left: 10),
      child: Center(
        child: DropdownButton<String>(
          underline: Container(height: 0,),
          value: wardValue,
          icon: const Icon(Icons.arrow_drop_down_sharp),
          iconSize: 24,
          style: const TextStyle(color: Colors.blueGrey),
          onChanged: (String newValue) {
            setState(() {
              wardValue = newValue;
            });
          },
          items: <String>['Select Ward','A','B','Obs & Gynae','Paediatric']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),
          color: Colors.white70,
          border: Border.all(color: Colors.blue[900])
      ),

    );
  }
  Container DropDown11() {
    return Container(width: 120,padding: EdgeInsets.only(left: 10),
      child: Center(
        child: DropdownButton<String>(
          underline: Container(height: 0,),
          value: floor,
          icon: const Icon(Icons.arrow_drop_down_sharp),
          iconSize: 24,
          style: const TextStyle(color: Colors.blueGrey),
          onChanged: (String newValue) {
            setState(() {
              floor = newValue;
            });
          },
          items: <String>['Select Floor','1','2','3','4']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),
          color: Colors.white70,
          border: Border.all(color: Colors.blue[900])
      ),

    );
  }
}
