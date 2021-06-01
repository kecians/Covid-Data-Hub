import 'package:flutter/material.dart';
class TodayStatus extends StatefulWidget {
  int home,mig,death,recov,active;
  TodayStatus({this.death,this.home,this.mig,this.recov,this.active});
  @override
  _TodayStatusState createState() => _TodayStatusState();
}

class _TodayStatusState extends State<TodayStatus> {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10,left: 15,right: 15),
      child: Column(
        children: [
          SizedBox(height: 12,),
          Text("Todays Status",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16,color: Colors.blueGrey[900],)),
          Divider(),
          SizedBox(height: 5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              Container(
                width: 100,
                child: Column(
                  children: [
                    Text(
                      "Deaths",
                      style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16,color: Colors.blueGrey[600]),
                    ),
                    SizedBox(height: 8,),
                    Text(
                      "${widget.death}",
                      overflow: TextOverflow.fade,
                      style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14,color: Colors.blue[700]),
                    ),
                  ],
                ),
              ),
              Container(
                width: 100,
                child: Column(
                  children: [
                    Text(
                      "Recovered",
                      style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16,color: Colors.blueGrey[600]),
                    ),
                    SizedBox(height: 8,),
                    Text(
                      "${widget.recov}",
                      overflow: TextOverflow.fade,
                      style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14,color: Colors.blue[700]),
                    ),
                  ],
                ),
              ),
              Container(
                width: 100,
                child: Column(
                  children: [
                    Text(
                      "Referred",
                      style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16,color: Colors.blueGrey[600]),
                    ),
                    SizedBox(height: 8,),
                    Text(
                      "${widget.mig}",
                      overflow: TextOverflow.fade,
                      style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14,color: Colors.blue[700]),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              Container(
                width: 120,
                child: Column(
                  children: [
                    Text(
                      "Home Isolated",
                      style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16,color: Colors.blueGrey[600]),
                    ),
                    SizedBox(height: 8,),
                    Text(
                      "${widget.home}",
                      overflow: TextOverflow.fade,
                      style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14,color: Colors.blue[700]),
                    ),
                  ],
                ),
              ),
              Container(
                width: 100,
                child: Column(
                  children: [
                    Text(
                      "Hospitalised",
                      style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16,color: Colors.blueGrey[600]),
                    ),
                    SizedBox(height: 8,),
                    Text(
                      "${widget.active}",
                      overflow: TextOverflow.fade,
                      style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14,color: Colors.blue[700]),
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 10,),

        ],
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
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
