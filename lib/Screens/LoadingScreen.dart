import 'package:patient_status_app/Model/Networking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:patient_status_app/Screens/Status.dart';
class Loading_Screen extends StatefulWidget {
  final String designation;
  Loading_Screen({this.designation});
   @override
  _Loading_ScreenState createState() => _Loading_ScreenState();
}

class _Loading_ScreenState extends State<Loading_Screen> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async{
    var data = await Networking().getBedStatus();
    print("this is $data");

    Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context){return Status(data: data);}));
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