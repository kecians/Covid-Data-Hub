import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:patient_status_app/Model/Networking.dart';
import 'package:patient_status_app/Screens/BottomAppScreen.dart';
class SearchBar extends StatefulWidget {
  final designation,token;
  SearchBar({this.designation,this.token});
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  TextEditingController inputController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        controller: inputController,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Search..',
            hintStyle: TextStyle(color: Colors.grey),
            contentPadding: EdgeInsets.symmetric(vertical: 13, horizontal: 20.0),
            suffixIcon: IconButton(icon: Icon(Icons.search,color: Colors.grey,),onPressed: onpress)

        ),
      ),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white
        ,boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: 6.0,
          ),
        ],),
      margin: EdgeInsets.only(left: 10,right: 10),
    );
  }
  onpress()async{
    if(inputController.text!="")
      {
        final progress = ProgressHUD.of(context);
        progress.show();
        var response = await Networking().getSearched(inputController.text);
        progress.dismiss();
        showModalBottomSheet(context: context, builder:(context)=>
            BottomAppScreen(lst: response,designation: widget.designation,token: widget.token,));

      }
   }
}
