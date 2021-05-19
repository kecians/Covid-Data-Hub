import 'package:flutter/material.dart';
class SearchPatientCard extends StatelessWidget {
  const SearchPatientCard({
    this.patientName,this.onPress,this.admittedOn,this.status
  });
  final String patientName,admittedOn;
  final String status;
  final Function onPress;

  String category()
  {
    if( status == "A")
    {
      return  "Active";
    }
    else if(status == 'R')
    {
      return "Recovered";
    }
    else if(status == 'D')
    {
      return 'Death';
    }
    else if(status == 'M'){
      return 'Migrated';
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
              width: 80,
              child: Text(
                category()
                ,style: TextStyle(fontWeight: FontWeight.w800,color: Colors.green[800],fontSize: 12),
              ),
            ),
            Container(
              width: 80,
              child: Text(
                admittedOn.substring(0,10),
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
