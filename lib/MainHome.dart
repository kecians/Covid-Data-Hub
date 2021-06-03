import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:patient_status_app/Components/DetailCard.dart';
import 'package:patient_status_app/Components/TodayStatusCard.dart';
import 'package:patient_status_app/Model/LoadingScreenHome.dart';
import 'package:patient_status_app/Screens/Home.dart';
import 'package:patient_status_app/Screens/LoadingScreen.dart';
import 'Components/MyCard.dart';
import 'Components/RoundButton.dart';
import 'Components/TitleHead.dart';
import 'Model/Networking.dart';
import 'package:carousel_pro/carousel_pro.dart';
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
  int ox,gen,ven,icu,availox,home,availgen,availicu,availven,total,alloted,active,migrated,recov,death;
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
    home = data['home_isolated'];
  }
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      child: SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            bottomNavigationBar: Container(
              height: 30,
              color: Colors.black,
              child: Center(child: Text("Developed by Ayush Bisht | Prashant Pandey | Shubham Tripathi BTKIT Dwarahat",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white,fontSize: 12,),),),
            ),
            body:Stack(
              children: [
                Container(
                  alignment: Alignment.bottomLeft,
                  child: SvgPicture.asset('assets/CovidAnimate.svg',height: 140,width: 140,),

                ),
                Center(

                  child: ListView(
                    children:[
                      TitleHead(height: 100,),
                      SizedBox(height: 10),
                      SizedBox(
                          height: 200.0,
                          width: 300.0,
                          child: Carousel(
                            images: [
                              Padding(
                                padding: const EdgeInsets.only(top: 5,bottom: 5),
                                child: Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    MyCard(height: 200,width: 160,headText: 'Total Patients',headerSize: 17,valueColor: Colors.blueGrey[600],
                                      color: Colors.white,valueSize: 50,
                                      /// Realtime Value
                                      valueText: "${alloted+home}",
                                      headerColor: Colors.blueGrey,
                                    ),
                                    MyCard(height: 200,width: 160,headText: 'Total Beds',headerSize: 17,valueColor: Colors.blueGrey[600],
                                      color: Colors.white,valueSize: 50,
                                      /// Realtime Value
                                      valueText: "$total",
                                      headerColor: Colors.blueGrey,
                                    )
                                  ],
                                )
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5,bottom: 5),
                                child: DetailCard(valueGen: availgen,valueIcu: availicu,valueOxy: availox,valueVen: availven,TotalGen: gen,TotalIcu: icu,
                                  TotalOxy: ox,TotalVen: ven,height: 200,
                                  color: Colors.white,),
                              ),
                            ],
                            dotSize: 0.0,
                            dotBgColor: Colors.transparent,
                            borderRadius: true,
                            animationDuration:Duration(seconds: 1),
                          )
                      ),
                      TodayStatus(recov:recov,death: death,mig: migrated,home: home,active : active),
                      Column(
                        children: [

                          SizedBox(height: 30),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundButton(color: Color(0XFFE901579B),text: "Staff Login", textColor: Colors.white,
                                onpress: (){Navigator.push(context,MaterialPageRoute(builder:(context)=>Home()));},height: 50,width: 115,),
                              SizedBox(height: 20,),
                              RoundButton(color: Color(0XFFE901579B),text: "Patient Login", textColor: Colors.white,
                                onpress: (){Navigator.push(context,MaterialPageRoute(builder: (context)=>PatientLogin()));}
                                ,height: 50,width: 115,),
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
      ),
      onRefresh: () async {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => LoadingScreenHome()));
        await Future.value({});
      },
    );
  }
}
