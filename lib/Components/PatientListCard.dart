import 'package:flutter/material.dart';
class PatientListCard extends StatelessWidget {
  const PatientListCard({
    this.patientName,this.bedNo
  });
  final String patientName,bedNo;

  @override
  Widget build(BuildContext context) {
    return InkWell(

      child: Container(
        margin: EdgeInsets.only(top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [

            Text(
                patientName
            ),
            Text(
                bedNo
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
