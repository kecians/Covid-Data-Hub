import 'package:flutter/material.dart';
class SearchBar extends StatelessWidget {
  const SearchBar({this.onPress});
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        showCursor: false,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Search..',
            hintStyle: TextStyle(color: Colors.grey),
            contentPadding: EdgeInsets.symmetric(vertical: 13, horizontal: 20.0),
            suffixIcon: IconButton(icon: Icon(Icons.search,color: Colors.grey,),onPressed: onPress,)

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
}
