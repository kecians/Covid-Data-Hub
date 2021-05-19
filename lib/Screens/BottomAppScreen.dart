import 'package:flutter/material.dart';
import 'package:patient_status_app/Components/SearchPatientCard.dart';
import 'package:patient_status_app/Model/Networking.dart';
import 'package:patient_status_app/Screens/Patient/InfoDischarged.dart';
import 'package:patient_status_app/Utilities/constants.dart';

class BottomAppScreen extends StatefulWidget {
  final designation,token;
  final List lst;
  const BottomAppScreen({this.lst,this.token,this.designation});

  @override
  _BottomAppScreenState createState() => _BottomAppScreenState();
}

class _BottomAppScreenState extends State<BottomAppScreen> {
  var res =[];
  @override
  void initState() {
   response(widget.token);
  }
  response(_token)async {
    var resp = await Networking().getPatientList(_token);
    setState(() {
      res = resp;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          children: [
            Container(
              height: 50,
              color: Colors.blueGrey[900],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Patient Name',style: kwhite),
                  Text('Status',style: kwhite),
                  Text('Admitted On',style: kwhite)
                ],
              ),
            ),
            Expanded(child: ListView.builder(
                itemCount: widget.lst.length,
                itemBuilder:(context , index){
                  return Padding(
                    padding: const EdgeInsets.only(left: 5 , right: 5),
                    child: SearchPatientCard(patientName: widget.lst[index]['name'] ,status:widget.lst[index]['patient_status'],
                        admittedOn: widget.lst[index]["created_on"],onPress: (){
                           Navigator.pushReplacement(context,MaterialPageRoute(builder:(context)=>InfoDischarged(data: widget.lst[index],
                             desgination: widget.designation,token: widget.token,)));
                        }),
                  );

                }))
          ],
        ),
    );
  }

}
