import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
class PatientListCard extends StatelessWidget {
  const PatientListCard({
    this.patientName,this.onPress,this.admittedOn,this.isBed
  });
  final String patientName,admittedOn;
  final isBed;
  final Function onPress;

  String condition(){
    if(isBed == null) {
      return "Null";
    }
    return "F${isBed['floor']}-${isBed['ward']}-${isBed['bed_number']} ${category()}";
  }
  String category()
  {
    if(isBed['bed_category'] == "1")
      {
        return  "GEN";
      }
    else if(isBed['bed_category'] == "2")
      {
        return "OXY";
      }
    else if(isBed['bed_category'] == '3')
      {
        return 'ICU';
      }
    else if(isBed['bed_category'] == '4'){
      return 'VEN';
    }
 }

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

              width: 85,
              child: Text(
                  condition()
                  ,style: TextStyle(fontWeight: FontWeight.w800,color: Colors.green[800],fontSize: 12),
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
