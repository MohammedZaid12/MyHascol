import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hascol/hascol_screens/CommonThings/All_Instances.dart';

class MyUsers extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyusersState();
  }
}

class MyusersState extends State<MyUsers> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        actions: <Widget>[cFunc.logoImageAdd(150.0, 150.0)],
        title: Text("My Users"),
      ),
      body: ListView(children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              child: Text("Regions", style: TextStyle(fontSize: 40.0)),
              margin: EdgeInsets.only(),
            ),
            Container(
                child: Switch(
              value: isSwitched,
              onChanged: (value) {
                setState(() {
                  isSwitched = value;
                });
              },
              activeTrackColor: Colors.blue,
              activeColor: Colors.blue,
            ))
          ],
        )
      ]),
    );
  }
}
