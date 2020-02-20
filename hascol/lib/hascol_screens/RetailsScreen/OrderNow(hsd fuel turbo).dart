import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hascol/hascol_screens/RetailsScreen/Retails.dart';
import 'package:hascol/hascol_screens/CommonThings/All_Instances.dart';

class OrderHsdFuel extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return OrderNowHSDFuelState();
  }
}

class OrderNowHSDFuelState extends State<OrderHsdFuel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        actions: <Widget>[cFunc.logoImageAdd(150.0, 150.0)],
        title: Text("Order Now"),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20.0),
            child: Column(children: <Widget>[
              imageAdd(150.0, 150.0, "images/SuperTiger-XT-logo.jpg"),
              Text(
                "HSD (Fuel Turbo)",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
              ),
              cFunc.buttons("Order Now", () {})
            ]),
          ),
        ],
      ),
    );
  }
}
