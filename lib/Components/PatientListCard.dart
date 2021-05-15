import 'package:flutter/material.dart';
class PatientListCard extends StatelessWidget {
  const PatientListCard({
    this.patientName,this.bedNo,this.onPress,this.admittedOn
  });
  final String patientName,bedNo,admittedOn;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return InkWell(
       onTap: onPress,
      child: Container(
        margin: EdgeInsets.only(top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [

            Container(
              width: 100,
              child: Text(
                  patientName,
                overflow: TextOverflow.fade,
                style: TextStyle(fontWeight: FontWeight.w600,fontSize: 12),
              ),
            ),
            Container(
              width: 50,
              child: Text(
                  bedNo
                  ,style: TextStyle(fontWeight: FontWeight.w800,color: Colors.green[800]),
              ),
            ),
            Container(
              width: 80,
              child: Text(
                admittedOn,
                style: TextStyle(fontWeight: FontWeight.w800,fontSize: 12),
              ),
            )
          ],
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 1.0), //(x,y)
                blurRadius: 6.0,
              ),
            ]
        ),
        height: 60,width: 330,
      ),

    );
  }
}
