import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:patient_status_app/Components/DetailCard.dart';
import 'package:patient_status_app/Components/MyCard.dart';
import 'package:patient_status_app/Components/RoundButton.dart';
import 'package:patient_status_app/Components/TodayStatusCard.dart';
import 'package:patient_status_app/Model/Networking.dart';
import 'package:patient_status_app/Screens/BottomAppScreen.dart';
import 'package:patient_status_app/Screens/LoadingScreen.dart';

import 'Patient/AddPatient.dart';
class Status extends StatefulWidget {
  static final String id = 'Status';
  final data;
  final responseList;
  Status({this.data,this.responseList});
  @override
  _StatusState createState() => _StatusState();
}

class _StatusState extends State<Status> {
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
      child: Scaffold(

        body: ProgressHUD(
          child: Builder(
            builder: (context)=>ListView(
              children: [
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MyCard(height: 120,width: 160,headText: 'Total Patients',headerSize: 17,valueColor: Colors.blueGrey[600],
                      color: Colors.white,valueSize: 30,
                      /// Realtime Value
                      valueText: "${alloted+home}",
                      headerColor: Colors.blueGrey,
                    ),
                    MyCard(height: 120,width: 160,headText: 'Total Beds',headerSize: 17,valueColor: Colors.blueGrey[600],
                      color: Colors.white,valueSize: 30,
                      /// Realtime Value
                      valueText: "$total",
                      headerColor: Colors.blueGrey,
                    )
                  ],
                ),
                SizedBox(height: 20,),

                DetailCard(valueGen: availgen,valueIcu: availicu,valueOxy: availox,valueVen: availven,TotalGen: gen,TotalIcu: icu,
                  TotalOxy: ox,TotalVen: ven,height: 200,
                  color: Colors.white,),
                TodayStatus(recov:recov,death: death,mig: migrated,home: home,active : active),
                SizedBox(height: 40,),
                Column(
                  children: [
                    Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RoundButton(color:Colors.lightBlue[900],text: "Deaths", textColor: Colors.white,
                          onpress: ()async{

                            final progress = ProgressHUD.of(context);
                            progress.show();
                            var response = await Networking().getSearched("Death");
                            if(response['status']==404)
                              {progress.dismiss();
                              CoolAlert.show(
                                context: context,
                                type: CoolAlertType.error,
                                text: " Data not Found!",
                              );
                              }
                            else{progress.dismiss();
                            showModalBottomSheet(context: context, builder:(contexts)=>
                                BottomAppScreen(lst: response['data'],designation: widget.responseList[1],token: widget.responseList[3],));
                            }
                          },height: 50,width: 140,),
                        RoundButton(color: Colors.lightBlue[900],text: "Referred", textColor: Colors.white,
                          onpress: ()async{

                            final progress = ProgressHUD.of(context);
                            progress.show();
                            var response = await Networking().getSearched("Migrated");
                            if(response['status']==404)
                            {progress.dismiss();
                            CoolAlert.show(
                              context: context,
                              type: CoolAlertType.error,
                              text: " Data not Found!",
                            );
                            }
                            else{progress.dismiss();
                            showModalBottomSheet(context: context, builder:(contexts)=>
                                BottomAppScreen(lst: response['data'],designation: widget.responseList[1],token: widget.responseList[3],));
                            }
                          },height: 50,width: 140,),

                      ],
                    ),
                    SizedBox(height: 20,),
                    Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RoundButton(color: Colors.lightBlue[900],text: "Home Isolated", textColor: Colors.white,
                          onpress: ()async{

                            final progress = ProgressHUD.of(context);
                            progress.show();
                            var response = await Networking().getSearched("home_isolated");
                            if(response['status']==404)
                            {progress.dismiss();
                            CoolAlert.show(
                              context: context,
                              type: CoolAlertType.error,
                              text: " Data not Found!",
                            );
                            }
                            else{progress.dismiss();
                            showModalBottomSheet(context: context, builder:(contexts)=>
                                BottomAppScreen(lst: response['data'],designation: widget.responseList[1],token: widget.responseList[3],));
                            }
                          },height: 50,width: 140,),
                        RoundButton(color: Colors.lightBlue[900],text: "Recovered", textColor: Colors.white,
                          onpress: ()async{

                            final progress = ProgressHUD.of(context);
                            progress.show();
                            var response = await Networking().getSearched("Recovered");
                            if(response['status']==404)
                            {progress.dismiss();
                            CoolAlert.show(
                              context: context,
                              type: CoolAlertType.error,
                              text: " Data not Found!",
                            );
                            }
                            else{progress.dismiss();
                            showModalBottomSheet(context: context, builder:(contexts)=>
                                BottomAppScreen(lst: response['data'],designation: widget.responseList[1],token: widget.responseList[3],));
                            }
                          },height: 50,width: 140,),

                      ],
                    ),

                  ],
                ),
                SizedBox(height: 40,)
              ],
            ),
          ),
        ),
      ),
      onRefresh: () async {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => Loading_Screen()));
        await Future.value({});
      },
    );
  }
}