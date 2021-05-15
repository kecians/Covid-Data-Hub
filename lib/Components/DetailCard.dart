import 'package:flutter/material.dart';
class DetailCard extends StatelessWidget {
  const DetailCard({this.height,this.color,this.valueGen,this.TotalGen,this.TotalIcu,this.TotalOxy,this.TotalVen,this.valueIcu,this.valueOxy,this.valueVen});
  final double height;
  final Color color;
  final int valueGen, TotalGen, valueOxy , TotalOxy ,valueVen,TotalVen,valueIcu,TotalIcu;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15,right: 15),
      padding: EdgeInsets.only(top: 20,bottom: 20),
      height: height,width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                      Text("General Beds",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16,color: Colors.blueGrey)),
                      SizedBox(height: 5,),
                      Text("(Available / Total )",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 10,color: Colors.grey)),
                  SizedBox(height: 10,),
                  Text("$valueGen / $TotalGen",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 22,color: Colors.blue[700]) )
                ],
              ),
              Column(
              children: [
                Text("Oxygen Beds",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16,color: Colors.blueGrey)),
                SizedBox(height: 5,),
                Text("(Available / Total )",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 10,color: Colors.grey)),
                SizedBox(height: 10,),
                Text("$valueOxy / $TotalOxy",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 22,color: Colors.blue[700]) )
              ],
              )
          ],),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text("ICU Beds",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16,color: Colors.blueGrey)),
                  SizedBox(height: 5,),
                  Text("(Available / Total )",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 10,color: Colors.grey)),
                  SizedBox(height: 10,),
                  Text("$valueIcu / $TotalIcu",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 22,color: Colors.blue[700]) )
                ],
              ),
              Column(
                children: [
                  Text("Ventilator Beds",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16,color: Colors.blueGrey)),
                  SizedBox(height: 5,),
                  Text("(Available / Total )",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 10,color: Colors.grey)),
                  SizedBox(height: 10,),
                  Text("$valueVen / $TotalVen",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 22,color: Colors.blue[700]) )
                ],
              )
            ],),

        ],
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: color,
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
