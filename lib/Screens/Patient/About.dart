import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class About extends StatelessWidget {
  const About({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        title: Text('Developer Info'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
            Text('This Application is Designed and Developed by:',style: TextStyle(fontSize: 16),),
            SizedBox(height: 20,),
            InkWell( onTap: (){launch("https://www.linkedin.com/in/ayush-bisht-9a5582192");},
                child: Text('Ayush Bisht',style: TextStyle(fontSize: 16),)),
            SizedBox(height: 20,),
            InkWell(onTap: (){launch("https://linkedin.com/in/shubham-tripathi-727424144");},
                child: Text('Shubham Tripathi',style: TextStyle(fontSize: 16),)),
            SizedBox(height: 20,),
            InkWell(onTap: (){ launch("https://prashantpandey.ml"); },
                child: Text('Prashant Pandey',style: TextStyle(fontSize: 16),)),
            SizedBox(height: 20,),
            Text('Bipin Tripathi Kumaon Institute of Technology',style: TextStyle(fontSize: 16),),
            SizedBox(height: 20,),

          ],
        ),
      ),
    ));
  }
}
