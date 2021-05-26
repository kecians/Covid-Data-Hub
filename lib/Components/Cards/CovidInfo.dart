import 'package:flutter/material.dart';
class CovidInfo extends StatelessWidget {
   final String result,type,vaccination,vaccine;

  CovidInfo({this.result, this.type, this.vaccination, this.vaccine});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10,left: 15,right: 15),
      child: Column(
        children: [
          SizedBox(height: 15,),
          Text("Covid Info",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 20,color: Colors.lightBlue[800],)),
          SizedBox(height: 15,),
          Divider(),
          SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              Container(
                width: 120,
                child: Column(
                  children: [
                    Text(
                      "Test Result",
                      style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16,color: Colors.blueGrey[600]),
                    ),
                    SizedBox(height: 8,),
                    Text(
                      result,
                      overflow: TextOverflow.fade,
                      style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14,color: Colors.lightBlue[800]),
                    ),
                  ],
                ),
              ),
              Container(
                width: 120,
                child: Column(
                  children: [
                    Text(
                      "Test Type",
                      style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16,color: Colors.blueGrey[600]),
                    ),
                    SizedBox(height: 8,),
                    Text(
                      type,
                      overflow: TextOverflow.fade,
                      style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14,color: Colors.lightBlue[800]),
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 30,),
          Divider(),
          SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              Container(
                width: 100,
                child: Column(
                  children: [
                    Text(
                      "Vaccination",
                      style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16,color: Colors.blueGrey[600]),
                    ),
                    SizedBox(height: 8,),
                    Text(
                      vaccination,
                      overflow: TextOverflow.fade,
                      style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14,color: Colors.lightBlue[800]),
                    ),
                  ],
                ),
              ),
              Container(
                width: 100,
                child: Column(
                  children: [
                    Text(
                      "Vaccine",
                      style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16,color: Colors.blueGrey[600]),
                    ),
                    SizedBox(height: 8,),
                    Text(
                      vaccine,
                      overflow: TextOverflow.fade,
                      style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14,color: Colors.lightBlue[800]),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey[200],
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 6.0,
            ),
          ]
      ),
      height:380,width: 330,
    );
  }
}
