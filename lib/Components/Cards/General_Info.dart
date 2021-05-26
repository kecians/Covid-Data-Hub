import 'package:flutter/material.dart';
class General_Info extends StatelessWidget {
  final int age;
  final String name,gender,patId,condition,contact,address,bedNo;
  General_Info({this.name, this.age, this.gender, this.patId,
    this.condition, this.contact, this.address, this.bedNo});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10,left: 15,right: 15),
      child: Column(
        children: [
          SizedBox(height: 15,),
          Text("General Info",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 20,color: Colors.lightBlue[800],)),
          SizedBox(height: 15,),
          Divider(),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              Container(
                width: 120,
                child: Column(
                  children: [
                    Text(
                      "Name",
                      style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16,color: Colors.blueGrey[600]),
                    ),
                    SizedBox(height: 8,),
                    Text(
                      name,
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
                      "Patient ID",
                      style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16,color: Colors.blueGrey[600]),
                    ),
                    SizedBox(height: 8,),
                    Text(
                     patId,
                      overflow: TextOverflow.fade,
                      style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14,color: Colors.lightBlue[800]),
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 10,),
          Divider(),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              Container(
                width: 100,
                child: Column(
                  children: [
                    Text(
                      "Gender",
                      style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16,color: Colors.blueGrey[600]),
                    ),
                    SizedBox(height: 8,),
                    Text(
                      gender,
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
                      "Age",
                      style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16,color: Colors.blueGrey[600]),
                    ),
                    SizedBox(height: 8,),
                    Text(
                      "$age",
                      overflow: TextOverflow.fade,
                      style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14,color: Colors.lightBlue[800]),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10,),
          Divider(),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              Container(
                width: 100,
                child: Column(
                  children: [
                    Text(
                      "Contact",
                      style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16,color: Colors.blueGrey[600]),
                    ),
                    SizedBox(height: 8,),
                    Text(
                      contact,
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
                      "Condition",
                      style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16,color: Colors.blueGrey[600]),
                    ),
                    SizedBox(height: 8,),
                    Text(
                      condition,
                      overflow: TextOverflow.fade,
                      style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14,color: Colors.lightBlue[800]),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10,),
          Divider(),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              Container(
                width: 280,
                child: Column(
                  children: [
                    Text(
                      "Address",
                      style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16,color: Colors.blueGrey[600]),
                    ),
                    SizedBox(height: 8,),
                    Text(
                      address,
                      overflow: TextOverflow.fade,
                      style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14,color:Colors.lightBlue[800]),
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
