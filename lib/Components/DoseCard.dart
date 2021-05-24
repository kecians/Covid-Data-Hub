import 'package:flutter/material.dart';
import 'package:patient_status_app/Utilities/constants.dart';

class DoseCard extends StatelessWidget {
  const DoseCard({this.vacName,this.date,this.onPress});
  final String vacName,date;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return Container( padding: EdgeInsets.only(top: 20,bottom: 20),
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          Text("Dose ",style: kwhite.copyWith(fontSize: 14),),
          SizedBox(height: 20,),
          Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column( crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Vaccine Name",style: kwhite.copyWith(fontSize: 14),),
                  SizedBox(height: 10,),
                  Text(vacName,style: kwhite.copyWith(color: Colors.grey[200]))
                ],
              ),
              Column( crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Vaccinated On",style: kwhite.copyWith(fontSize: 14),),
                  SizedBox(height: 10,),
                  Text(date,style: kwhite.copyWith(color: Colors.grey[200]))
                ],
              ),
              IconButton(onPressed: onPress, icon: Icon(Icons.remove_circle_outline,color: Colors.white,))
            ],
          ),
        ],
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blue[600],
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 6.0,
            ),
          ]
      ),
    );
  }
}
