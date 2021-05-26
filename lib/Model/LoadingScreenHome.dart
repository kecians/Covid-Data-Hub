import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:patient_status_app/MainHome.dart';
import 'package:patient_status_app/Model/Networking.dart';
class LoadingScreenHome extends StatefulWidget {
  static final String id = "LoadingScreenHome";
  @override
  _LoadingScreenHomeState createState() => _LoadingScreenHomeState();
}

class _LoadingScreenHomeState extends State<LoadingScreenHome> {
  var result=[];
  @override
  void initState() {
    getData();
  }
  void getData() async{
    var data = await Networking().getBedStatus();
    print("this is $data");

    Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context){return MainHome(data: data);}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(child: SpinKitCircle(
          color:Colors.lightBlue[900],
        ))
    );
  }
}
