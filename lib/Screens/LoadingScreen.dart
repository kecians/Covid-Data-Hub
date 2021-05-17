import 'package:patient_status_app/Model/Networking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:patient_status_app/Screens/Status.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Loading_Screen extends StatefulWidget {
   @override
  _Loading_ScreenState createState() => _Loading_ScreenState();
}

class _Loading_ScreenState extends State<Loading_Screen> {
  SharedPreferences logindata;
  var result=[];
  @override
  void initState() {
    this.initial();
    getData();
  }
  initial() async{
    logindata =await SharedPreferences.getInstance();
    setState(() {
      result = logindata.getStringList('res');
    });
    print(result);
  }
  void getData() async{
    var data = await Networking().getBedStatus();
    print("this is $data");

    Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context){return Status(data: data,responseList: result);}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(child: SpinKitCircle(
          color: Colors.blue[900],
        ))
    );
  }
}