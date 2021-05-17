import 'package:flutter/material.dart';
import 'package:patient_status_app/Screens/Home.dart';
import 'package:patient_status_app/Screens/PatientList.dart';
import 'package:shared_preferences/shared_preferences.dart';
class MyDrawer extends StatelessWidget {
  SharedPreferences preferences;
  final String name,designation;
  final responsedata;
  MyDrawer({this.name, this.designation,this.responsedata});
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // TODO : Change the section According to demand
        UserAccountsDrawerHeader(
          accountName: Text(name,style: TextStyle(fontSize: 16),),
          accountEmail: Text(designation,style: TextStyle(color: Colors.white70,fontSize: 12),),
          arrowColor: Colors.black54,
          currentAccountPicture: GestureDetector(
            child: CircleAvatar(
              backgroundColor: Colors.grey[900],
              child: Icon(Icons.account_balance_outlined),
            ),
          ),
          decoration: BoxDecoration(
            color: Colors.lightBlue[900],
          ),
        ),

        /// Components

        InkWell(
          onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context){
            return PatientList(data: responsedata,);}));},
          child: ListTile(
            title: Text('Patient List'),
            leading: Icon(
              Icons.trending_up,
              color: Colors.blueGrey,
            ),
          ),
        ),
        Divider(indent: 20,endIndent: 20, thickness: 1,),
        InkWell(
          onTap: ()async{ preferences = await SharedPreferences.getInstance();
          preferences.setBool('isLoggedIn', false);
             Navigator.pushReplacementNamed(context, Home.id);},
          child: ListTile(
            title: Text('Logout'),
            leading: Icon(
              Icons.logout,
              color: Colors.blueGrey,
            ),
          ),
        ),
        Divider(indent: 20,endIndent: 20, thickness: 1,),


      ],
    );
  }
}
