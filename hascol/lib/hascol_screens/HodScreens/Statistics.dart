import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hascol/hascol_screens/CommonThings/All_Instances.dart';

class Statistics extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return StatisticsState();
  }
}

class StatisticsState extends State<Statistics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      backgroundColor: Colors.deepOrange,
      actions: <Widget>[cFunc.logoImageAdd(150.0, 150.0)],
      title: Text("STATISTICS"),
    ));
  }
}
