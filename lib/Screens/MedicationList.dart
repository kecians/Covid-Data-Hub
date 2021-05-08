import 'package:flutter/material.dart';
import 'package:patient_status_app/Components/Drawer.dart';
import 'package:patient_status_app/Components/MyContainer.dart';
class MedicationList extends StatefulWidget {
  static const String id = 'MedicationList';
  @override
  _MedicationListState createState() => _MedicationListState();
}

class _MedicationListState extends State<MedicationList> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      drawer: Drawer(
        child: MyDrawer(),
      ),
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[900],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(),
            Text('Medication'),
            IconButton(icon: Icon(Icons.calendar_today,color: Colors.white,),onPressed: (){},)
          ],
        )
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 10,),
          MyContainer(height: 120,color1: Colors.blue[900],color2: Colors.lightBlue[900],

          ),
          SizedBox(height: 10,),

          MyContainer(height: 60,color1: Colors.orange,color2: Colors.amber,
            widget: Text('Morning Medication'),
          ),
          SizedBox(height: 10,),
          MyContainer(height: 60,color1: Colors.green,color2: Colors.amber,
            widget: Text('Afternoon Medication'),
          ),
          SizedBox(height: 10,),
          MyContainer(height: 60,color1: Colors.orange,color2: Colors.amber,
            widget: Text('Evening Medication'),
          ),

        ],
      ),
    ));
  }
}

