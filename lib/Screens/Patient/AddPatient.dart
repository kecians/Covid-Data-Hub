import 'package:cool_alert/cool_alert.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:patient_status_app/Components/MyTextField.dart';
import 'package:patient_status_app/Components/RoundButton.dart';
import 'package:patient_status_app/Model/Networking.dart';
import 'package:patient_status_app/Model/Toast.dart';
import 'package:patient_status_app/Screens/LoadingScreen.dart';
import 'package:patient_status_app/Utilities/constants.dart';

class AddPatient extends StatefulWidget {
  final token;
  AddPatient({this.token});
  @override
  _AddPatientState createState() => _AddPatientState();
}

class _AddPatientState extends State<AddPatient> {
  Networking instance = Networking();
  DateTime selectedDate1 = DateTime.now();
  DateTime selectedDate2 = DateTime.now();
  TextEditingController _date = new TextEditingController();
  String dropdownValue1 = "Gender",
      dropdownValue2 = "Bed Type",
      dropdownValue3 = "Condition",dropdownValue4="Covid Test",
      dropdownValue5 = "Test Type",dropdownValue6 = "Test Result",admissionType= "Select Admission Category",
     dropdownValue7 = "Vaccination",dropdownValue8= "Vaccine Status",floor="Select Floor",wardValue="Select Ward",vaccineName="Name of Vaccine";
  String name,number,age,bedNo,address,remark;
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
                    SizedBox(height: 30,),
                    Text('Patient Admission Form',
                      style: TextStyle(color: Colors.lightBlue[900], fontSize: 26,
                        fontWeight: FontWeight.w900,),),
                    SizedBox(height: 30),
                    MyTextField(text: 'Enter Patient\'s Name',
                        width: 260,
                        onPress: (value) {name = value;}),
                    SizedBox(height: 20),
                    MyTextField(text: 'Patient\'s Phone Number',
                        width: 260,
                        inputType: TextInputType.number,
                        onPress: (value) {number = value;}),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DropDown1(),
                        SizedBox(width: 20,),

                        MyTextField(text: 'Age',
                            width: 120,
                            inputType: TextInputType.number,
                            onPress: (value) {age = value;}),
                      ],
                    ),
                    SizedBox(height: 20,),
                    DropDown3(),
                    SizedBox(height: 20,),
                    MyTextField(text: 'Address',
                        width: 260,
                        inputType: TextInputType.streetAddress,
                        onPress: (value) {address=value;}),
                    SizedBox(height: 40),
                    Container(
                      width: double.infinity,

                      height: 50,color: Colors.blue[900],
                      child: Center(child: Text('Admission Details',style: TextStyle(color: Colors.white,fontSize: 20),)),
                    ),
                    SizedBox(height: 40,),
                    DropDown12(),
                    admissionType == 'Hospitalization'? Column(children: [
                      SizedBox(height: 20,),
                      DropDown2(),
                      SizedBox(height: 20,),
                      MyTextField(text: 'Bed Number',
                          width: 260,
                          inputType: TextInputType.number,
                          onPress: (value) {bedNo=value;}),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          DropDown9(),
                          SizedBox(width: 20,),
                          DropDown11()
                        ],
                      ),
                    ],): SizedBox(height: 1,),
                    SizedBox(height: 40,),
                    Container(
                      width: double.infinity,
                      height: 50,color: Colors.blue[900],
                      child: Center(child: Text('Covid Details',style: TextStyle(color: Colors.white,fontSize: 20),)),
                    ),
                    SizedBox(height: 40,),
                    DropDown4(),
                    SizedBox(height: 20,),
                    dropdownValue4 == 'Yes' ? Column(
                      children: [
                        Row( mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            DropDown5(),
                            SizedBox(width: 20,),
                            DropDown6(),
                          ],
                        ),

                        SizedBox(height: 20,)
                      ],
                    ): SizedBox(height: 1,),
                    DropDown7(),
                    SizedBox(height: 20,),
                    dropdownValue7 == 'Yes' ? Column(
                      children: [
                        DropDown10(),
                        SizedBox(height: 20,),
                        DropDown8(),
                        SizedBox(height: 20,)
                      ],
                    ) : SizedBox(height: 1,),
                    ((){
                      if(dropdownValue8 == "1st Dose"){
                        return Column(
                          children: [
                            Text('1st Dose date',style: TextStyle(color: Colors.grey),),
                            Date1(),
                          ],
                        );
                      }
                      else if(dropdownValue8 == '1st and 2nd Dose')
                        { return Column(children: [
                          Text('1st Dose date',style: TextStyle(color: Colors.grey),),
                          Date1(),
                          SizedBox(height: 20,),
                          Text('2nd Dose date',style: TextStyle(color: Colors.grey),),
                          Date2()
                        ],);
                        }
                      else{return SizedBox(height: 1,);}
                    })(),
                    SizedBox(height: 40,),
                    MyTextField(text: 'Remark',
                        width: 260,
                        inputType: TextInputType.streetAddress,
                        onPress: (value) {remark=value;}),
                    SizedBox(height: 30),
                    RoundButton(color: Colors.lightBlue[900],
                      text: "Submit",
                      textColor: Colors.white,
                      onpress: ()async {
                        final progress = ProgressHUD.of(context);
                        progress.show();
                        var res = await instance.AddPatient(widget.token, name, age,dropdownValue1,
                            dropdownValue2, bedNo, number,dropdownValue3, address, wardValue, floor,
                            dropdownValue4,dropdownValue5,dropdownValue6, dropdownValue7, vaccineName,
                            dropdownValue8, selectedDate1, selectedDate2,remark,admissionType);
                        if(res == 201)
                        { showToast(context, "Patient added Successfully");
                          Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context)=>Loading_Screen()), (route) => false);
                        }
                        else
                        {
                          CoolAlert.show(
                            context: context,
                            type: CoolAlertType.error,
                            text: "Some field is empty or Bed already alloted!",
                          );
                        }
                        progress.dismiss();
                      },
                      height: 50,
                      width: 260,),
                    SizedBox(height: 40,)
                  ],
                ),
              ],
            ),
          ),
        ),
      )
    ));
  }

  Container DropDown1() {
    return Container(width: 120,
      child: Center(
        child: DropdownButton<String>(
          underline: Container(height: 0,),
          value: dropdownValue1,
          icon: const Icon(Icons.arrow_drop_down_sharp),
          iconSize: 24,
          style: const TextStyle(color: Colors.blueGrey),
          onChanged: (String newValue) {
            setState(() {
              dropdownValue1 = newValue;
            });
          },
          items: <String>['Gender', 'M', 'F']
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

  Container DropDown3() {
    return Container(width: 260,padding: EdgeInsets.only(left: 3),
      child: Center(
        child: DropdownButton<String>(
          underline: Container(height: 0,),
          value: dropdownValue3,
          icon: const Icon(Icons.arrow_drop_down_sharp),
          iconSize: 24,
          style: const TextStyle(color: Colors.blueGrey),
          onChanged: (String newValue) {
            setState(() {
              dropdownValue3 = newValue;
            });
          },
          items: <String>[
            "Condition",
            "Asymptomatic",
            "Mild",
            "Moderate",
            "Severe"
          ]
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
  Container DropDown4() {
    return Container(width: 260,padding: EdgeInsets.only(left: 3),
      child: Center(
        child: DropdownButton<String>(
          underline: Container(height: 0,),
          value: dropdownValue4,
          icon: const Icon(Icons.arrow_drop_down_sharp),
          iconSize: 24,
          style: const TextStyle(color: Colors.blueGrey),
          onChanged: (String newValue) {
            setState(() {
              dropdownValue4 = newValue;
            });
          },
          items: <String>[
            "Covid Test",
            "Yes",
            "No"
          ]
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
  Container DropDown5() {
    return Container(width: 125,padding: EdgeInsets.only(left: 10),
      child: Center(
        child: DropdownButton<String>(
          underline: Container(height: 0,),
          value: dropdownValue5,
          icon: const Icon(Icons.arrow_drop_down_sharp),
          iconSize: 24,
          style: const TextStyle(color: Colors.blueGrey),
          onChanged: (String newValue) {
            setState(() {
              dropdownValue5 = newValue;
            });
          },
          items: <String>['Test Type','Rapid AntiGen','RT-PCR','TrueNat']
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
  Container DropDown6() {
    return Container(width: 120,padding: EdgeInsets.only(left: 10),
      child: Center(
        child: DropdownButton<String>(
          underline: Container(height: 0,),
          value: dropdownValue6,
          icon: const Icon(Icons.arrow_drop_down_sharp),
          iconSize: 24,
          style: const TextStyle(color: Colors.blueGrey),
          onChanged: (String newValue) {
            setState(() {
              dropdownValue6 = newValue;
            });
          },
          items: <String>['Test Result','Positive','Negative','Awaited','Rejected']
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
  Container DropDown7() {
    return Container(width: 260,padding: EdgeInsets.only(left: 10),
      child: Center(
        child: DropdownButton<String>(
          underline: Container(height: 0,),
          value: dropdownValue7,
          icon: const Icon(Icons.arrow_drop_down_sharp),
          iconSize: 24,
          style: const TextStyle(color: Colors.blueGrey),
          onChanged: (String newValue) {
            setState(() {
              dropdownValue7 = newValue;
            });
          },
          items: <String>['Vaccination','Yes','No']
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
  Container DropDown8() {
    return Container(width: 260,padding: EdgeInsets.only(left: 10),
      child: Center(
        child: DropdownButton<String>(
          underline: Container(height: 0,),
          value: dropdownValue8,
          icon: const Icon(Icons.arrow_drop_down_sharp),
          iconSize: 24,
          style: const TextStyle(color: Colors.blueGrey),
          onChanged: (String newValue) {
            setState(() {
              dropdownValue8 = newValue;
            });
          },
          items: <String>['Vaccine Status','1st Dose','1st and 2nd Dose']
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
  Container DropDown10() {
    return Container(width: 260,padding: EdgeInsets.only(left: 10),
      child: Center(
        child: DropdownButton<String>(
          underline: Container(height: 0,),
          value: vaccineName,
          icon: const Icon(Icons.arrow_drop_down_sharp),
          iconSize: 24,
          style: const TextStyle(color: Colors.blueGrey),
          onChanged: (String newValue) {
            setState(() {
              vaccineName = newValue;
            });
          },
          items: <String>['Name of Vaccine','CoviShield','Covaxin']
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
  Container DropDown12() {
    return Container(width: 260,padding: EdgeInsets.only(left: 10),
      child: Center(
        child: DropdownButton<String>(
          underline: Container(height: 0,),
          value: admissionType,
          icon: const Icon(Icons.arrow_drop_down_sharp),
          iconSize: 24,
          style: const TextStyle(color: Colors.blueGrey),
          onChanged: (String newValue) {
            setState(() {
              admissionType = newValue;
            });
          },
          items: <String>['Select Admission Category','Hospitalization','Home Isolation']
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
  Date1(){
    return Container(width: 260,
      child: DateField(
          onDateSelected: (DateTime value) {
            setState(() {
              selectedDate1 = value;
            });
          },
          selectedDate: selectedDate1,
          label:null,
          decoration: kInputDecorantion
      ),

    );
  }
  Date2(){
    return Container(width: 260,
      child: DateField(
          onDateSelected: (DateTime value) {
            setState(() {
              selectedDate2 = value;
            });
          },
          selectedDate: selectedDate2,
          label:null,
          decoration: kInputDecorantion
      ),

    );

  }
}