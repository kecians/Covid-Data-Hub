
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:patient_status_app/Components/RoundButton.dart';
import 'package:patient_status_app/Model/Networking.dart';
import 'package:patient_status_app/Screens/LoadingScreen.dart';
import 'package:patient_status_app/Utilities/constants.dart';
import 'package:patient_status_app/Components/TitleHead.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Home extends StatefulWidget {
  static const String id = 'HomeScreen';
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Networking instance = Networking();
  SharedPreferences logindata;
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  String errortext ="";
  bool isLogin;
  var res;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    check_if_loggedIn();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: Container(
          height: 30,
          color: Colors.black,
          child: Center(child: Text("Developed by Ayush Bisht | Prashant Pandey | Shubham Tripathi BTKIT Dwarahat",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white,fontSize: 12,),),),
        ),
        body: ProgressHUD(
          child: Builder(
            builder: (context)=> Stack(
                  children: [
                    Container(
                      alignment: Alignment.bottomLeft,
                      child: SvgPicture.asset('assets/CovidAnimate.svg',height: 200,width: 200,),

                    ),
                    Center(

                      child: ListView(

                        children:[
                          TitleHead(height: 140,),
                          SizedBox(height: 40),
                          Column(
                            children: [
                              Text(errortext,style: TextStyle(color: Colors.red),),
                              SizedBox(height: 10,),
                              Container(
                                width: 260,
                                child: TextField(

                                  controller: _usernameController,

                                  style: TextStyle(color: Colors.black),
                                  decoration: kInputDecorantion.copyWith(hintText: "Enter Your Username"),
                                ),
                              ),
                              SizedBox(height: 30),
                              Container(
                                width: 260,
                                child: TextField(
                                  obscureText: true,
                                  controller: _passwordController,
                                  style: TextStyle(color: Colors.black),
                                  decoration: kInputDecorantion.copyWith(hintText: 'Enter your password',),
                                ),
                              ),
                              SizedBox(height: 80),
                              RoundButton(color: Color(0XFFE901579B),text: "Login", textColor: Colors.white,
                                onpress: ()async{
                                  final progress = ProgressHUD.of(context);
                                  if(_usernameController.text.length <=4 || _passwordController.text.length<3)
                                  {
                                    CoolAlert.show(
                                      context: context,
                                      type: CoolAlertType.error,
                                      text: " Enter too Short!",
                                    );
                                  }
                                  else{
                                    progress.show();
                                    var response = await instance.signin(_usernameController.text, _passwordController.text);
                                    print("this $response");
                                    if(response[0] == 200)
                                    { String status = "${response[0]}"; String desig = response[1];
                                    String user = response[2]; String token = response[3];
                                    List<String> lst = [status,desig,user,token];
                                    print(lst);
                                    logindata.setBool('isLoggedIn', true);
                                    logindata.setStringList('res', lst);
                                    setState(() {
                                      res = response;
                                    });
                                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                                        builder: (context){return Loading_Screen();}), (route) => false);
                                    }
                                    else
                                    {
                                      errortext = "Invalid User";
                                      setState(() {
                                        // ignore: unnecessary_statements
                                        errortext;
                                        _usernameController.text = "";
                                        _passwordController.text ="";
                                      });
                                    }
                                    progress.dismiss();
                                  }

                                }
                                ,height: 50,width: 260,),
                              SizedBox(height: 40,),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
          ),
        )
      ),
    );
  }

  check_if_loggedIn() async{
    logindata = await SharedPreferences.getInstance();
    isLogin = (logindata.getBool('isLoggedIn') ?? false);

    if(isLogin == true)
      {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Loading_Screen()));
      }
  }

}

