import 'package:flutter/material.dart';
class LastFiveCard extends StatelessWidget {
  final String cond,temp;
  final int sis,dia,spo2,pulse;
  LastFiveCard({this.cond,this.temp,this.pulse,this.spo2,this.dia,this.sis});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Column(
        children: [
           SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

              Container(
                width: 100,
                child: Column(
                  children: [
                    Text(
                      "Condition",
                      style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16),
                    ),
                    SizedBox(height: 10,),
                    Text(
                      "$cond",
                      overflow: TextOverflow.fade,
                      style: TextStyle(fontWeight: FontWeight.w600,fontSize: 12),
                    ),
                  ],
                ),
              ),
              Container(
                width: 80,
                child: Column(
                  children: [
                    Text(
                      "B P",
                      style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16),
                    ),
                    SizedBox(height: 10,),
                    Text(
                      "$sis / $dia",
                      overflow: TextOverflow.fade,
                      style: TextStyle(fontWeight: FontWeight.w600,fontSize: 12),
                    ),
                  ],
                ),
              ),
              Container(
                width: 80,
                child: Column(
                  children: [
                    Text(
                      "Pulse Rate",
                      style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16),
                    ),
                    SizedBox(height: 10,),
                    Text(
                      "$pulse",
                      overflow: TextOverflow.fade,
                      style: TextStyle(fontWeight: FontWeight.w600,fontSize: 12),
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

              Container(
                width: 100,
                child: Column(
                  children: [
                    Text(
                      "Temperature",
                      style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16),
                    ),
                    SizedBox(height: 10,),
                    Text(
                      "$temp °F",
                      overflow: TextOverflow.fade,
                      style: TextStyle(fontWeight: FontWeight.w600,fontSize: 12),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 10,),
              Container(
                width: 100,
                child: Column(
                  children: [
                    Text(
                      "SPO2 Level",
                      style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16),
                    ),
                    SizedBox(height: 10,),
                    Text(
                      "$spo2 %",
                      overflow: TextOverflow.fade,
                      style: TextStyle(fontWeight: FontWeight.w600,fontSize: 12),
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
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 6.0,
            ),
          ]
      ),
      height:160,width: 330,
    );
  }
}
