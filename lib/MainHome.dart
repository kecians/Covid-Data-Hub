import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:patient_status_app/Components/DetailCard.dart';
import 'package:patient_status_app/Components/TodayStatusCard.dart';
import 'package:patient_status_app/Screens/Home.dart';
import 'Components/RoundButton.dart';
import 'Components/TitleHead.dart';
import 'Model/Networking.dart';
import 'Screens/PatientLogin.dart';
class MainHome extends StatefulWidget {
  final data;
  MainHome({this.data});
static final String id = 'MainHome';
  @override
  _MainHomeState createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  Networking instance = Networking();
  int ox,gen,ven,icu,availox,availgen,availicu,availven,total,alloted,active,migrated,recov,death;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    update(widget.data);
  }

  void update(dynamic data)
  {
    gen = data['generalBeds'];
    ven = data['ventilatorBeds'];
    ox = data['oxygenBeds'];
    icu = data['icuBeds'];
    availgen =data['generalBeds'] - data['allotedGenBeds'];
    availicu =data['icuBeds'] - data['allotedIcuBeds'];
    availox =data['oxygenBeds'] - data['allotedOxyBeds'];
    availven =data['ventilatorBeds'] - data['allotedVenBeds'];
    total = data['totalBeds'];
    alloted = data['allotedTotal'];
    active = data['active'];
    migrated = data['migrated'];
    recov = data['recovered'];
    death = data['death'];
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          bottomNavigationBar: Container(
            height: 30,
            color: Colors.black,
            child: Center(child: Text("@Copyright @2021 All rights reserved",
              style: TextStyle(color: Colors.white,fontSize: 12),),),
          ),
          body:Stack(
            children: [
              Container(
                alignment: Alignment.bottomLeft,
                child: SvgPicture.asset('assets/CovidAnimate.svg',height: 200,width: 200,),

              ),
              Center(

                child: ListView(

                  children:[
                    TitleHead(height: 100,),
                    SizedBox(height: 20),
                    DetailCard(valueGen: availgen,valueIcu: availicu,valueOxy: availox,valueVen: availven,TotalGen: gen,TotalIcu: icu,
                      TotalOxy: ox,TotalVen: ven,height: 200,
                      color: Colors.white,),
                    TodayStatus(recov:recov,death: death,mig: migrated,active: active,),
                    Column(
                      children: [

                        SizedBox(height: 100),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundButton(color: Color(0XFFD5031A8D),text: "Staff Login", textColor: Colors.white,
                              onpress: (){Navigator.push(context,MaterialPageRoute(builder:(context)=>Home()));},height: 50,width: 120,),
                            SizedBox(width: 20,),
                            RoundButton(color: Color(0XFFB7570384),text: "Patient Login", textColor: Colors.white,
                              onpress: (){Navigator.push(context,MaterialPageRoute(builder: (context)=>PatientLogin()));}
                              ,height: 50,width: 120,),
                          ],
                        )

                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
      ),
    );
  }
}